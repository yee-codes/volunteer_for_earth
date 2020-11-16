class OpportunitiesController < ApplicationController
  # Anyone can view all the listings, but only authenticated or authorised users can access other controller actions
  skip_before_action :authenticate_user!, :only => [:index]

  # List all current volunteering opportunities
  def index
    if params[:query].present?
      @opportunities = Opportunity.search(params[:query])
    else
      @opportunities = Opportunity.all
    end
  end

  # Show one opportunity
  def show
    @opportunity = Opportunity.find(params[:id])
  end

  # Initialise a new opportunity listing
  def new
    @opportunity = Opportunity.new
  end

  # Render existing data in the edit form
  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  # Associate a newly created opportunity listing to a particular user, only the user
  # that created the listing can edit or delete the listing
  def create
    @opportunity = current_user.opportunities.create(opportunity_params)
    
    Opportunity.new(opportunity_params)
   
    if @opportunity.save
      redirect_to @opportunity
    else
      render 'new'
    end
  end

  # Put/patch method to update a listing
  def update
    @opportunity = Opportunity.find(params[:id])
   
    if @opportunity.update(opportunity_params)
      redirect_to @opportunity
    else
      render 'edit'
    end
  end

  # Method to delete a listing
  def destroy
    @opportunity = Opportunity.find(params[:id])
    @opportunity.destroy
   
    redirect_to opportunities_path
  end

  private

  # Strong params
  def opportunity_params
    params.require(:opportunity).permit(:organisation, :title, :location, :description, :image)
  end
end