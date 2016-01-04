class User < ActiveRecord::Base
  attr_reader :password

  after_initialize :ensure_session_token

  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    return nil if @user.nil?
    @user.is_password?(password) ? @user : nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save!
    session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
