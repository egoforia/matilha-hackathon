class AddQuestionToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :question, index: true, after: :user_id
    add_foreign_key :answers, :questions
  end
end
