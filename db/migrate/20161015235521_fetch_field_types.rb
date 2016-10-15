class FetchFieldTypes < ActiveRecord::Migration
  def change
  	FieldType.create([
  		{title: 'text'},
  		{title: 'select'},
  		{title: 'check'},
  		{title: 'radio'},
  		{title: 'number'},
  		{title: 'upload'},
  	])
  end
end
