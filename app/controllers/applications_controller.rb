class ApplicationsController < ApplicationController
  def index
      @applications = Application.all
  end

  def show
      @application = Application.find(params[:id])
  end

  def new
      @event = Event.find(params[:event_id])
      @application = Application.new
  end
    
   def create

     @application = Application.new
     @application.appname = params[:application][:appname]
     @application.url = params[:application][:url]

     @event = Event.find(params[:event_id])
     @application.event = @event   

     if @application.save
       flash[:notice] = "Application was saved."
       redirect_to [@event, @application]
     else
       flash.now[:alert] = "There was an error saving the application. Please try again."
       render :new
     end
   end    

  def edit
      @application = Application.find(params[:id])
  end
    
   def update
     @application = Application.find(params[:id])
     @application.appname = params[:application][:appname]
     @application.url = params[:application][:url]
 
     if @application.save
       flash[:notice] = "Application was updated."
       redirect_to [@application.event, @application]
     else
       flash.now[:alert] = "There was an error saving the application. Please try again."
       render :edit
     end
   end    
    
   def destroy
     @application = Application.find(params[:id])
 
     if @application.destroy
       flash[:notice] = "\"#{@application.appname}\" was deleted successfully."
       redirect_to @application.event
     else
       flash.now[:alert] = "There was an error deleting the application."
       render :show
     end
   end    
    
end
