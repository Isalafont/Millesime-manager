class Castle < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
