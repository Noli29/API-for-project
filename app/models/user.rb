class User < ActiveRecord::Base

  attr_accessible :name, :surname,  :email, :password,  :password_confirmation, :role_id,  :avatar
  attr_accessor :password, :password_confirmation
  has_attached_file :avatar,  :styles => {  }

  has_private_messages


  before_save { |user| user.email = email.downcase }
  before_save :encrypt_password
  before_create { generate_token(:auth_token) }


  belongs_to :role
  has_many :posts


  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 1 }
  validates :password_confirmation, presence: true
  validates_attachment :avatar,
                       :size => { :in => 0..10.megabytes },
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/}

  def full_name
    "#{name}#{surname}"
  end

  def super_admin?
    ["super_admin"].include? self.role.try(:name)
  end

  def admin?
    ["admin", "super_admin"].include? self.role.try(:name)
  end

  def role?(role)
    ["super_admin"].include? self.role.try(:name)
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end