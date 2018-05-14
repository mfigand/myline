class Child < User

  validates :birthday, presence: true

  # belongs_to :user
  has_many :relationships
  has_many :users, through: :relationships

  # belongs_to :parent
  has_many :tellers
  has_many :stories



end
