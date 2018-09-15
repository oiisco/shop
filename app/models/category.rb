class Category < ApplicationRecord
  has_many :poducts

  validates :name, presence: true
end
