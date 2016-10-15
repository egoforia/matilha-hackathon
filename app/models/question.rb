class Question < ActiveRecord::Base
	belongs_to :form
	belongs_to :field_type

	has_many :question_options
end