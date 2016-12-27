class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
          :omniauthable, :omniauth_providers => [:facebook, :twitter]
  class << self

    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash[:uid], provider: auth_hash[:provider])
      user.name = auth_hash[:info][:name]
      user.email = auth_hash[:info][:email]
      user.skip_confirmation!
      user.save!
      user
    end
  end
end
