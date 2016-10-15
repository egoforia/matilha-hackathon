class AddJumpLogicQuestionIfToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :jump_logic_if, :boolean
  end
end
