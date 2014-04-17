== README

To access this game, you can simply go to: 
	
	mauxy.net:3000
	
Otherwise, if you want to run it on your own machine, there are additional instructions.

The best way to run this application is to fork over the github project. 

	https://github.com/mauriciofmar3/MangoTango

Once you have that, you would have to install the following: 

Ruby 1.9.3
Ruby on Rails framework 

If you want to have other users be able to play against you (instead of having different 
browsers on the same computer) you'll have to install apache, or some kind of server software. 

Once you installed those, simply paste the following into the command line

	bundle install
	rake db:migrate
	rake db:seed
	rails server
	
And you should be good to go!

To access the game, go to: 
		
	localhost:3000
	
And you'll be routed to the login page!

Have fun playing!



BUGS: 
bugs:
-chat input box in safari doesn't pop up. Works in other browsers.
-tells when you connect in other games(all players) but not what you say 
-if using the nutsy cards package, the cards can't be picked when judge if “&” is in the card. Can edit them out if you'd like. 
-when linked to a game, you sometimes have to refresh