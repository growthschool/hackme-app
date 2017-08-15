class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments

    if params[:keyword]
      @comments = @comments.where( "comments.content LIKE ?", "%#{params[:keyword]}%")
    end

    if params[:sort] && ["id DESC", "id ASC"].include?(params[:sort])
      @comments = @comments.order(params[:sort])
    end

  end

end
