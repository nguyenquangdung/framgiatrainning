module SessionsHelper
	def sign_in(trainee)
    remember_token = Trainee.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    trainee.update_attribute(:remember_token, Trainee.digest(remember_token))
    self.current_trainee = trainee
  end
  def sign_in(supervisor)
    remember_token = Supervisor.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    supervisor.update_attribute(:remember_token, Supervisor.digest(remember_token))
    self.current_supervisor = supervisor
  end
  def signed_in?
    !current_user.nil?
  end
  def current_trainee=(trainee)
    @current_trainee = trainee
  end
  def current_supervisor=(supervisor)
    @current_supervisor = supervisor
  end
  def current_trainee
    remember_token = Trainee.digest(cookies[:remember_token])
    @current_trainee ||= Trainee.find_by(remember_token: remember_token)
  end
  def current_supervisor
    remember_token = Supervisor.digest(cookies[:remember_token])
    @current_supervisor ||= Supervisor.find_by(remember_token: remember_token)
  end
  def sign_out
    current_trainee.update_attribute(:remember_token,
                                  Trainee.digest(Trainee.new_remember_token))
    cookies.delete(:remember_token)
    self.current_trainee = nil
    current_supervisor.update_attribute(:remember_token,
                                  Supervisor.digest(Supervisor.new_remember_token))
    cookies.delete(:remember_token)
    self.current_supervisor = nil
  end
end
