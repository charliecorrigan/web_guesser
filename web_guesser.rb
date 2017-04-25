require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(101)
background_color = 'white'

def get_message(user_guess)
  if user_guess.nil?
    return ""
  end
  message = "Your guess was #{user_guess}."
  if user_guess.to_i > (SECRET_NUMBER + 5)
    message += "Your guess was way too high."
  elsif user_guess.to_i > SECRET_NUMBER
    message += "Your guess was too high."
  elsif user_guess.to_i < (SECRET_NUMBER - 5)
    message += "Your guess was way too low."
  elsif user_guess.to_i < SECRET_NUMBER
    message += "Your guess was too low."
  elsif user_guess.to_i == SECRET_NUMBER
    message += "You got it!\nThe secret number was #{SECRET_NUMBER}."
  end
end

def get_background_color(user_guess)
  if user_guess.nil?
    return "white"
  end
  if user_guess.to_i > (SECRET_NUMBER + 5)
    return "red"
  elsif user_guess.to_i > SECRET_NUMBER
    return "pink"
  elsif user_guess.to_i < (SECRET_NUMBER - 5)
    return "red"
  elsif user_guess.to_i < SECRET_NUMBER
    return "pink"
  elsif user_guess.to_i == SECRET_NUMBER
    return "green"
  end
end

get '/' do
  user_guess = params['guess']
  message = get_message(user_guess)
  background_color = get_background_color(user_guess)
  erb :index, :locals => {:background_color => background_color, :message => message}
end