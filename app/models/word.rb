class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy, inverse_of: :word
  has_many :word_lessons, dependent: :destroy
  has_many :lessons, through: :word_lessons
  
  validates :keyword, presence: true, length: {maximum: 30}

  accepts_nested_attributes_for :answers, allow_destroy: true, 
                      reject_if: lambda {|answer| answer[:meaning].blank?}
  accepts_nested_attributes_for :answers

  sub_query_learned_by = "id IN (select DISTINCT word_id from word_lessons inner join lessons on word_lessons.lesson_id = lessons.id"
  sub_query_learned_by += " where word_lessons.answer_id <> '' && lessons.user_id = ?)"
  scope :learned_by, -> (user){where sub_query_learned_by, user.id}
  scope :all_by, ->(user){}
  scope :not_learned_by, -> (user){where.not id: learned_by(user).map(&:id)}
  
end
