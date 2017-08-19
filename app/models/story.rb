class Story < ActiveRecord::Base

  validates :name, :date, :image, :tag, :user_id, presence: true

  belongs_to :user 
  
end