class Category < ActiveRecord::Base
  has_many :lessons
  has_many :words
  
  validates :name, presence: true, length: {maximum: 30}

  accepts_nested_attributes_for :words
end
