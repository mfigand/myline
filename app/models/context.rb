class Context < ActiveRecord::Base

  # Paperclip validations
  # validates :coverPicture, attachment_presence: true
  # validates_with AttachmentPresenceValidator, attributes: :coverPicture
  # validates_with AttachmentSizeValidator, attributes: :coverPicture, less_than: 1.megabytes
  # validates :aboutPicture, attachment_presence: true
  # validates_with AttachmentPresenceValidator, attributes: :aboutPicture
  # validates_with AttachmentSizeValidator, attributes: :aboutPicture, less_than: 1.megabytes
  # validates :parallaxPicture, attachment_presence: true
  # validates_with AttachmentPresenceValidator, attributes: :parallaxPicture
  # validates_with AttachmentSizeValidator, attributes: :parallaxPicture, less_than: 1.megabytes

  has_attached_file :coverPicture, styles: {
   medium: "300x300>",
   small: "200x200!",
   xsmall: "150x150>",
   thumb: "100x100>",
   original: "1024x1024"},
   default_url: '/bg/bg-6.jpg'
  validates_attachment_content_type :coverPicture, content_type: /\Aimage\/.*\Z/

  has_attached_file :aboutPicture, styles: {
   medium: "300x300>",
   small: "200x200!",
   xsmall: "150x150>",
   thumb: "100x100>",
   original: "1024x1024"},
   default_url: '/bg/bg-4.jpg'
  validates_attachment_content_type :aboutPicture, content_type: /\Aimage\/.*\Z/

  has_attached_file :parallaxPicture, styles: {
   medium: "300x300>",
   small: "200x200!",
   xsmall: "150x150>",
   thumb: "100x100>",
   original: "1024x1024"},
   default_url: '/bg/bg-5.jpg'
  validates_attachment_content_type :parallaxPicture, content_type: /\Aimage\/.*\Z/

  belongs_to :user

end
