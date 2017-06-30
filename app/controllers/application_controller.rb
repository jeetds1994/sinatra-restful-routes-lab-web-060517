class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
   erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    # binding.pry
    redirect to "/recipes/#{@recipe.id}"

  end

  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :recipes
  end

  get '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  post '/recipes/:id/delete' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
  end

  get '/recipes/:id/edit' do

    @recipe = Recipe.find_by(id: params[:id])
    # @recipe = Recipe.update(@recipe.id, )
    erb :edit
    # Recipe.update(@recipe.id, params[:recipes])
  end

  post '/recipes/:id' do
    # binding.pry
    @recipe.find_by(id: params[:id])
    @recipe.update(params)
    erb :show
  end




end
