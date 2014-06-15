class TelevisionShowsController < ApplicationController
  def index
    @television_shows = TelevisionShow.all
  end

  def show
    @television_show = TelevisionShow.find(params[:id])
  end

  def new
    @television_show = TelevisionShow.new
  end
end
