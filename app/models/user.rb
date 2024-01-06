class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:amazon]

  def kindle_highlights
      kindle_client = KindleHighlights::Client.new(
        email_address: self.amazon_username,
        password: self.amazon_password
        )

      kindle_client.each do |book|
      highlight = kindle_client.highlights_for(book.asin)
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
