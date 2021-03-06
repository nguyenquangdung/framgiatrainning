class Supervisor < ActiveRecord::Base
	before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: {maximum:50}
  has_secure_password
  validates :password, length: { minimum: 6 }
  def Supervisor.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Supervisor.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Supervisor.digest(Supervisor.new_remember_token)
    end
end
