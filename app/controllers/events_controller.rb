class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_url
			flash[:notice] = "Your event was successfully added to the list!"
		else
			flash[:error] = "There was a problem adding your event to the list :( Please try again"
			render action: "new"
		end
	end

	def event_params
		params[:event].permit(:name, :description, :location)
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])

		if @event.update_attributes(event_params)
			redirect_to events_path
		else
			render action: "edit"
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_url
	end
end


