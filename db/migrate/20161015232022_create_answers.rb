class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true, null: false
      t.text :user_input
      t.references :upload, index: true
      t.references :question_option, index: true

      t.timestamps null: false
    end
    add_foreign_key :answers, :users
    add_foreign_key :answers, :uploads
    add_foreign_key :answers, :question_options
  end
end
