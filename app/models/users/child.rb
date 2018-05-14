class Child < User

  validates :birthday, presence: true

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

  has_and_belongs_to_many :parents

  has_many :parents_children
  has_many :parents, through: :parents_children
  # has_many :tellers
  # has_many :stories, through: :tellers


  def get_age

    years = DateTime.now.year - self.birthday.year
    months = years == 0 ? DateTime.now.month - self.birthday.month : 12 - self.birthday.month + DateTime.now.month
    days = DateTime.now.day - self.birthday.day

    age ={
      :years => years,
      :months => months,
      :days => days
    }

  end

end
