class CharactersController < ApplicationController

  def create
    @tv_show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)
    @character.television_show_id = @tv_show.id

    if @character.save
      flash[:notice] = "Success"
      redirect_to "/television_shows/#{@tv_show.id}"
    else
      flash.now[:notice] = "Unable to save your character, please follow these requirements:"
      render :'television_shows/show'
    end

  end

  private

  def character_params
    params.require(:character).permit(:character_name, :actor_name, :description)
  end
end
