class Form < ActiveRecord::Base
  belongs_to :lawyer

  has_many :questions

  def users
  	User.joins(answers: {question: :form}).where(forms: {id: self.id}).group('users.id')
  end
end
