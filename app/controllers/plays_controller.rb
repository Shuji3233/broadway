class PlaysController < ApplicationController
before_action :find_plays, only: [:show, :edit, :update, :destroy]

  def index
    @plays = Play.all.order("created_at DESC")
  end

  def show
    
  end
  

  def new
    @play = current_user.play.build
  end

  def create
    @play = current_user.play.build(play_params)

    if @play.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    
  end
  
  def update
    if @play.update(play_params)
      redirect_to play_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @play.destroy
    redirect_to root_path
  end
  

  private

  def play_params
    params.require(:play).permit(:title, :description, :directer)
  end
  
  def find_plays
    @play = Play.find(params[:id])
  end
  
  
end
