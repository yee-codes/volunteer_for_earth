class ChargesController < ApplicationController
  # Users don't have to be authenticated or authorised to make a donation
  skip_before_action :authenticate_user!, :only => [:new, :create]

  def new
  end
  
  def create
    @amount = 1000
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'V4E Donation',
      currency: 'aud',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
