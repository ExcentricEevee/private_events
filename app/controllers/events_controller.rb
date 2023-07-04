class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    # Users should only be able to edit/destroy their own events
    before_action :set_event, only: [:edit, :update, :destroy]
    before_action :redirect_unless_owner, only: [:edit, :update, :destroy]

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to @event
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @event = Event.find(params[:id])
        # is there a better way to check for authorization?

    end

    def update
        @event = Event.find(params[:id])

        if @event.update(event_params)
            redirect_to @event
        else
            flash.now[:alert] = "There was an error updating your event"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to root_path, status: :see_other
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location)
    end

    def set_event
        @event = Event.find(params[:id])
    end

    def redirect_unless_owner
        return if @event.creator.id == current_user.id

        redirect_to root_path, alert: "You're not authorized to do that"
    end
end
