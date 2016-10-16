class Form < ActiveRecord::Base
  belongs_to :lawyer

  has_many :questions
end
