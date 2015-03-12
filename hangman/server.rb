require 'sinatra'
require_relative 'lib/hangman.rb'

configure do
  enable :sessions
end

before do
  content_type :txt
end

get '/new/:answer' do
  session[:game] = Game.new(params[:answer])
  session[:game].answer
end

get '/guess/:guess' do
  if !session[:game].win? && !session[:game].game_over?
    session[:game].lguess(params[:guess].to_s)
    "Progress: #{session[:game].progress} Lives: #{session[:game].lives}"
  elsif session[:game].win?
    redirect '/winner'
  elsif session[:game].game_over?
    redirect '/gameover'
  end
end

get '/gameover' do
  session.clear
  "Game Over"
end

get '/' do
  "visit /new/<word> to begin"
end

get '/winner' do
  session.clear
  "Winner!!!!"
end


