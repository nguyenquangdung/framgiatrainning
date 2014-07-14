class SessionsController < ApplicationController

  def new
  end

  def create
  	trainee = Trainee.find_by(email: params[:session][:email].downcase)
    if trainee && trainee.authenticate(params[:session][:password])
      sign_in trainee
      redirect_to trainee
    else
    	supervivor = Supervivor.find_by(email: params[:session][:email].downcase)
    	if supervivor && supervivor.authenticate(params[:session][:password])
    		sign_in supervivor
      		redirect_to supervivor
    		else
     		flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
    	end
	end

  end

  def destroy
  	 sign_out
    redirect_to root_url
  end
end