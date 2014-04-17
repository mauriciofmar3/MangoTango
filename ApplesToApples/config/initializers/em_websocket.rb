EVENTCHAT_CONFIG = YAML.load_file("#{Rails.root}/config/eventchat.yml")[Rails.env].symbolize_keys

#escape html/xss
include ERB::Util

Thread.abort_on_exception = true

Thread.new {
  EventMachine.run {
    @sockets = Array.new
    
    EventMachine::WebSocket.start(EVENTCHAT_CONFIG) do |ws|
      ws.onopen do
        
      end

      ws.onclose do
        index = @sockets.index {|i| i[:socket] == ws}
        client = @sockets.delete_at index
        @sockets.each {|s| s[:socket].send h("#{client[:id]} has disconnected!")}
      end
    
      ws.onmessage do |msg|
        client = JSON.parse(msg).symbolize_keys
        case client[:action]
        when 'connect'
          @sockets.push({:id=>client[:id], :socket=>ws})
          @sockets.each {|s| s[:socket].send h("chat: table#{client[:table_id]}: #{client[:id]} has connected!")}
        when 'say'
          @sockets.each {|s| s[:socket].send h("chat: table#{client[:table_id]}: #{client[:id]} says : #{client[:data]}")}
        when 'pick_card'
          @sockets.each {|s| s[:socket].send h("pick_card: table#{client[:table_id]}: #{client[:id]} picks : #{client[:data]}")}
        end
      end
    end
  }
}
