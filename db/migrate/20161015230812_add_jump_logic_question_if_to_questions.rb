class AddJumpLogicQuestionIfToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :jump_logic_if, :boolean, after: :jump_logic_question_option_id
  end
end
