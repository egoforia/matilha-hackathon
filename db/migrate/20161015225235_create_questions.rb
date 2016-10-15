class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :title, null: false
    	t.references :form, index: true
    	t.references :field_type, index: true
    	t.boolean :is_required, null: false, default: false
    	t.text :description
    	t.text :law_description

      t.timestamps null: false
    end
  end
end
