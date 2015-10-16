class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: true, unless: :logged_with_facebook?
  before_save :format_email, unless: :logged_with_facebook?
  validates :facebook_id, uniqueness: true, allow_nil: true
  validates :password, length: { minimum: 6 }
  validates :password, presence: true, allow_blank: true, on: :update
  has_secure_password

  def logged_with_facebook?
    self.facebook_id.present?
  end

  def update_facebook_info(auth)
    create_pass
    update(
        facebook_id: auth["uid"],
        first_name: auth["info"]["name"].split(' ').first,
        last_name: auth["info"]["name"].split(' ').last,
        password: @temp_pass,
        password_confirmation: @temp_pass
      )
  end

  def profile_picture
    "https://graph.facebook.com/#{self.facebook_id}/picture?width=512&height=512"
  end

  private
  def create_pass
    @temp_pass = (0...8).map { (65 + rand(26)).chr }.join
  end

  def format_email
    self.email = email.downcase
  end
end
