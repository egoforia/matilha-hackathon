class QuestionOption < ActiveRecord::Base
  belongs_to :question

  has_one :question, foreign_key: "jump_logic_question_option_id"
end
