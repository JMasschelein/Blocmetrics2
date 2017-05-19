class EventsController < ApplicationController
    
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
     @event = Event.new
     @event.eventname = params[:event][:eventname]
 
     if @event.save
       redirect_to @event, notice: "Event was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end    
    
   def edit
     @event = Event.find(params[:id])
   end    
    
   def update
     @event = Event.find(params[:id])
 
     @event.eventname = params[:event][:eventname]
 
     if @event.save
        flash[:notice] = "Event was updated."
       redirect_to @event
     else
       flash.now[:alert] = "Error saving event. Please try again."
       render :edit
     end
   end    
    
   def destroy
     @event = Event.find(params[:id])
 
     if @event.destroy
       flash[:notice] = "\"#{@event.eventname}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the event."
       render :show
     end
   end    
    
end
