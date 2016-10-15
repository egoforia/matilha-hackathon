class AddJumpLogicQuestionToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :jump_logic_question, references: :questions, index: true, after: :jump_logic_if
    add_foreign_key :questions, :questions, column: :jump_logic_question_id
  end
end
