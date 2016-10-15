class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.string :title, null: false
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :question_options, :questions
  end
end
