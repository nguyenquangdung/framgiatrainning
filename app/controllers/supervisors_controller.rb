class SupervisorsController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def create
    @supervisor = Supervisor.new(user_params)
    if @supervisor.save
      sign_in @supervisor
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end
end
