class Teller < ActiveRecord::Base

  # belongs_to :user
  belongs_to :child
  has_many :stories

end
