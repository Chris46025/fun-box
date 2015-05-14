require 'bundler'
Bundler.require

class IdeaBoxApp < Sinatra::Base
	not_found do
    	erb :error
  	end

  	get '/' do
    	erb :index
  	end

  	get '/guess_number_game' do
  		number = rand(10)
  		guess = params[0].to_i
  		if guess == number
  			message = "You got it right"
  		elsif guess > number
  			message = "You were too high"
  		else
  			message = "You were too low"
  		end

  		erb :guess_number_game, :locals => {:number => number, :message => message}
  	end

	post '/guess_number_game' do
		num = rand(0..10)
  		erb :guess_number_game
  	end

  	get '/high_low_game' do
  		erb :high_low_game
  	end

  	  	get '/about_me' do
  		erb :about_me
  	end
end