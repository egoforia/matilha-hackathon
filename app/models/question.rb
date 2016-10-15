class Question < ActiveRecord::Base
	belongs_to :form
	belongs_to :field_type
	belongs_to :jump_logic_question_option, foreign_key: "jump_logic_question_option_id"

	has_many :question_options
end
