class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_event

  before_action :require_admin!, :only => [:highlight]

  def create
    @comment = @event.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      flash[:notice] = "成功留言"
      redirect_to event_path(@event)
    else
      render "events/show"
    end
  end

  def highlight
    @comment = @event.comments.find(params[:id])
    @comment.highlight_at = Time.now
    @comment.save!

    redirect_to event_path(@event)
  end

  def destroy
    @comment = @event.comments.find(params[:id])

    if @comment.can_deleted_by(current_user)
      flash[:notice] = "成功刪除留言"
      @comment.destroy
    end

    redirect_to event_path(@event)
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_event
    @event = Event.find( params[:event_id] )
  end

end
