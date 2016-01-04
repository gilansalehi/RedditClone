class Sub < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :mod_id, presence: true

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :mod_id,
    primary_key: :id
  )

  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :sub_id,
    primary_key: :id
  )

end
