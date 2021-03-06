class User < ActiveRecord::Base
  attr_accessible :college, :email, :first_name, :industry, :last_name, :linkedin, :location, :major, :phone, :university, :password, :password_confirmation, :year
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
