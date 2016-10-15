class ChangeTypeOfFieldTypeToTitle < ActiveRecord::Migration
  def change
  	rename_column :field_types, :type, :title
  end
end
