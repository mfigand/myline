class Child < ActiveRecord::Base

  validates :name, :birth_day, :user_id, presence: true

  # # Paperclip validations
  # validates :avatar, attachment_presence: true
  # validates_with AttachmentPresenceValidator, attributes: :avatar
  # # validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  #
  # has_attached_file :avatar, styles: {
  #  medium: "300x300>",
  #  small: "200x200!",
  #  xsmall: "150x150>",
  #  thumb: "100x100>",
  #  original: "1024x1024"},
  #  default_url: '/images/:style/missing.png'
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  # has_many :tellers
  has_many :stories


  def get_age

    age ={
      :years => DateTime.now.year - self.birth_day.year,
      :months => DateTime.now.month - self.birth_day.month,
      :days => DateTime.now.day - self.birth_day.day
    }

  end

end
