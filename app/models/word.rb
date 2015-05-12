class Word < ActiveRecord::Base
  belongs_to :answer
  belongs_to :category
  has_many :word_lesson
  has_many :lessons, through: :word_lesson
  
  validates :keyword, presence: true, length: {maximum: 30}
  validates :lesson_id, presence: true
end
