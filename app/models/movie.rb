class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
