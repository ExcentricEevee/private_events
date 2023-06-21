class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(param[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location)
    end
end
