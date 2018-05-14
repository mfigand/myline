class Teller < User

  belongs_to :child
  has_many :stories

end
