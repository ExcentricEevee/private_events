class EventAttendancesController < ApplicationController
    before_action :authenticate_user!

    def create
        @event = Event.find(params[:event_id])
        @attendee = EventAttendance.new(attendee_id: current_user.id, event_id: @event.id)

            if @attendee.save
                flash[:notice] = "Event joined successfully!"
                redirect_to @event
            else
                flash.now[:alert] = "There was a problem joining the event"
                render @event, status: :unprocessable_entity
            end
    end

    def destroy

    end
end
