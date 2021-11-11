class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists
  before_destroy :check_for_bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true

  def check_for_bookmarks
    unless bookmarks.empty?
      raise ActiveRecord::InvalidForeignKey
      raise ActiveRecord::Rollback
    end
  end
end
