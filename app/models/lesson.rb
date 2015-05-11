class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :word_lessons
  has_many :words, through: :word_lessons
end
