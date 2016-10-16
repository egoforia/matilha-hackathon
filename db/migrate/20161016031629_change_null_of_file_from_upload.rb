class ChangeNullOfFileFromUpload < ActiveRecord::Migration
  def change
  	change_column_null :uploads, :file, true
  end
end
