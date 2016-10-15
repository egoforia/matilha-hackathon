class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.references :lawyer, index: true

      t.timestamps null: false
    end
    add_foreign_key :forms, :lawyers
  end
end
