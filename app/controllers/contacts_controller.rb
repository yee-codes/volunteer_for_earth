class ContactsController < ApplicationController
  # Users don't have to be authenticated or authorised to use the contact form
  skip_before_action :authenticate_user!, :only => [:new, :create]

  # Initialise new contact
  def new 
    @contact = Contact.new
  end

  # Capture & send user's inputs in the contact form; and error handling
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
  redirect_to root_path, notice: 'Message sent successfully'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end
end
