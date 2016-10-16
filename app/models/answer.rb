class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :upload
  belongs_to :question_option
  belongs_to :question
end
