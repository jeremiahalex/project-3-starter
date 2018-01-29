class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :warranties
  has_many :tickets, through: :warranties

  # For Facebook Login
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  # new function to set the password without knowing the current
  # password used in our confirmation controller.
  def attempt_set_password(params)
   p = {}
   p[:password] = params[:password]
   p[:password_confirmation] = params[:password_confirmation]
   update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
   self.encrypted_password.blank?
  end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore.
  # Instead you should use `pending_any_confirmation`.
  def only_if_unconfirmed
   pending_any_confirmation {yield}
  end
end
