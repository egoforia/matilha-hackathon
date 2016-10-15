class AddJumpLogicQuestionToQuestion < ActiveRecord::Migration
  def change
  	add_reference :questions, :jump_logic_question_option, references: :question_options, index: true, after: :law_description
  end
end
