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

    get '/rock_paper_scissors_game' do
      #0 = rock
      #1 = paper
      #2 = scissors

      choice = params["pick"].to_i

      pick = rand(3)
      cpu = ""

      if pick ==  0
        cpu = "Rock"
        if choice == 1
          message = "You won"

        elsif choice == pick
          message = "You tied"
        else
          message = "You lost"
        end

      elsif pick ==  1
        cpu = "Paper"
        if choice == 2
          message = "You won"
        elsif choice == pick
          message = "You tied"
        else
          message = "You lost"
        end

      else
        cpu = "Scissors"
        if choice == 0
          message = "You won"
        elsif choice == pick
          message = "You tied"
        else
          message = "You lost"
        end

      end

      erb :rock_paper_scissors_game, :locals => {:pick => pick, :message => message, :cpu => cpu}
    end


  	get '/tic_tac_toe_game' do
  		erb :tic_tac_toe_game
  	end
end