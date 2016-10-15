class Lawyer < ActiveRecord::Base
  belongs_to :field_of_work

  has_many :forms
end
