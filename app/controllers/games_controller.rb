class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def edit
    @game = Game.find params[:id]
  end
  
  def update
    @game = Game.find params[:id]
     if @game.update_attributes(params[:game])
      redirect_to games_path
    else
      redirect_to games_path, :alert => "No se ha editado"
    end
  end
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    @game.save 
  end

  def destroy
    @game = Game.find params[:id]
    if @game.destroy
      redirect_to games_path
    else
      redirect_to games_path, :alert => "No se ha borrado"
    end
  end
end
