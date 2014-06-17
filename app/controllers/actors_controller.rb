class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
    @characters = Character.where(actor_id: @actor).all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      flash[:notice] = "Success"
      redirect_to actors_path
    else
      flash.now[:notice] = "Unable to save your actor"
      render :new
    end
  end

  private

  def actor_params
    params.require(:actor).permit(:name)
  end
end
