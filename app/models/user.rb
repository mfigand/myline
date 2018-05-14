class User < ActiveRecord::Base
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 250 }
  validates :email, uniqueness: true
  validates :password, presence: true, format: {with: /\A[a-zA-ZÑñ0-9\ ]+\z/}
  # validates :password, length: { minumum: 8 }
  # validates_each :password do |record, attr, value|
  #   record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  #   end
  # /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$/

  # Paperclip validations
  validates :avatar, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :avatar
  # validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

  has_attached_file :avatar, styles: {
   medium: "300x300>",
   small: "200x200!",
   xsmall: "150x150>",
   thumb: "100x100>",
   original: "1024x1024"},
   default_url: '/icons/rocket.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_one :context
  has_many :stories
  has_many :relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  # has_many :relationships
  # has_many :users, through: :relationships

  def children
    self.relationships.where(relationship:"parent").map{|relationship| relationship.followed}
  end

  def tellers
    Relationship.where(followed_id: self.id, relationship: "teller").map{|relationship| relationship.follower}
  end

  def tellers_kinships
    Relationship.where(followed_id: self.id, relationship: "teller").map{|relationship| relationship.kinship}
  end

  def get_age
    date_difference = (DateTime.now-self.birthday).to_i
    last_month = DateTime.now.month - 1

    years = date_difference / 365
    months = (date_difference % 365) / 30
    days = (days_in_month(last_month) - self.birthday.day) + DateTime.now.day

    age = {
      :years => years,
      :months => months,
      :days => days
    }
  end

  def days_in_month(month, year = Time.now.year)
    days_in_months = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

     return 29 if month == 2 && Date.gregorian_leap?(year)
     days_in_months[month]
  end


end
