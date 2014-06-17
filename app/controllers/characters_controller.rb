class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def create
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    @character.television_show_id = @television_show.id

    if @character.save
      flash[:notice] = "Success"
      redirect_to television_show_path(@television_show)
    else
      flash.now[:notice] = "Unable to save your character, please follow these requirements:"
      render :'television_shows/show'
    end

  def destroy
    character = Character.find(params[:id])
    show = TelevisionShow.find(character[:television_show_id])
    character.destroy
    flash[:notice] = "Character deleted."
    redirect_to television_shows_path(show)
  end

  end

  private

  def character_params
    params.require(:character).permit(:character_name, :actor_id, :description)
  end
end
