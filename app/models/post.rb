class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :author, presence: true
  validates :subs, length: { minimum: 1, message: "Must select at least one sub." }

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :post_subs

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

end
