class ApplicationController < Sinatra::Base

  get '/' do
    { message: "Hello world" }.to_json
  end

  set :default_content_type, 'application/json'


  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    # send associated reviews
    game.to_json(only: [:id, :titile, :genre, :price],include: {reviews: {include: :user} })
  end

end
