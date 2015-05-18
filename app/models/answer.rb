class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :word_lessons

  validates :meaning, presence: true
  validates :word_id, presence: true
end
