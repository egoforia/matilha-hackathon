class CreateFieldOfWorks < ActiveRecord::Migration
  def change
    create_table :field_of_works do |t|
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
