class EventAttendancesController < ApplicationController
    before_action :authenticate_user!

    def create
        @event = Event.find(params[:event_id])
        @attendee = EventAttendance.new(attendee_id: current_user.id, event_id: @event.id)

        # Don't allow the same user to join multiple times
        # Is there a better way to check for existance?
        if EventAttendance.exists?(attendee_id: current_user.id, event_id: @event.id)
            flash.now[:alert] = "You have already joined this event!"
            render "events/show", status: :unprocessable_entity
        else
            if @attendee.save
                flash[:notice] = "Event joined successfully!"
                redirect_to @event
            else
                flash.now[:alert] = "There was a problem joining the event"
                render "events/show", status: :unprocessable_entity
            end
        end
    end

    def destroy

    end
end
