class Parent < User

  has_many :parents_children
  has_many :children, through: :parents_children
  # has_many :stories, through: :children
  # has_many :tellers, through: :children

end
