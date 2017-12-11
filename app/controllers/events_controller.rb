class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments

    if params[:keyword]
      # @comments = @comments
      #             .where("comments.content LIKE '%#{params[:keyword]}%'")
      # keyword = ActiveRecord::Base.connection
      #                             .quote_string(params[:keyword])
      # @comments = @comments.where("comments.content LIKE '%#{keyword}%'")

      @comments = @comments
                  .where('comments.content LIKE ?', "%#{params[:keyword]}%")
    end

    order_mappings = {
      'id_asc' => 'id ASC',
      'id_desc' => 'id DESC'
    }

    order_options = %w[id_asc id_desc]

    order = order_options.map { |o| order_mappings[o] }.compact.join(', ')
    @comments = @comments.order(order)
    # if params[:sort] && ['id DESC', 'id ASC'].include?(params[:sort])
    #   @comments = @comments.order(params[:sort])
    # end
  end
end
