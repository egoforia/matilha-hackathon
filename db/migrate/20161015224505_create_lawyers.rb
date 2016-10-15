class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :OAB
      t.string :name, null: false
      t.string :email, null: false
      t.references :field_of_work, index: true

      t.timestamps null: false
    end
    add_foreign_key :lawyers, :field_of_works
  end
end
