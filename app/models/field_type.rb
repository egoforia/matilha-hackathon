class FieldType < ActiveRecord::Base

	def is_text?
		self.title == 'text'
	end

	def is_select?
		self.title == 'select'
	end

	def is_check?
		self.title == 'check'
	end

	def is_radio?
		self.title == 'radio'
	end

	def is_number?
		self.title == 'number'
	end

	def is_upload?
		self.title == 'upload'
	end
end
