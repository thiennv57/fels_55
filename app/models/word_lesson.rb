class WordLesson < ActiveRecord::Base
  belongs_to :answer
  belongs_to :lesson
  belongs_to :word

  scope :number_word_learned, ->{where "answer_id <> ''"}
end
