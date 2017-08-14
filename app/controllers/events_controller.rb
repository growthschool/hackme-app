class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments

    if params[:keyword]
       @comments = @comments.where( "comments.content LIKE '%#{params[:keyword]}%'")
      # @comments = @comments.where( "comments.content LIKE ?",'%#{params[:keyword]}%')
    end

    # if params[:sort]
      if params[:sort] && ["id DESC", "id ASC"].include?(params[:sort])  # 只有白名单内的参数可以用
      @comments = @comments.order(params[:sort])
    end

  end

end
# sql inject');DELETE FROM "comments" WHERE "comments"."event_id" = ?[["event_id", 11]];--
