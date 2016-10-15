class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file, null: false

      t.timestamps null: false
    end
  end
end
