class FormUserController < ApplicationController
	before_action :set_form, :set_user
  layout 'front-form'

  def show
  end

  def create
    @form.questions.each do |question|
      begin
        if question_params(question.id).has_key? :user_input
          answer = Answer.new
          answer.user = @user
          answer.question = question
          answer.assign_attributes(question_params(question.id))
          answer.save
        elsif question_params(question.id).has_key? :question_option_id
           question_params(question.id)[:question_option_id].each do |question_option_id|
            answer = Answer.new
            answer.user = @user
            answer.question = question
            answer.question_option_id = question_option_id
            answer.save
          end
        end
      rescue ActionController::ParameterMissing => e
        
      end
    end

    redirect_to form_success_path
  end

  def success
  end

  private
  	def set_form
  		@form = Form.find params[:form_id]
  	end

  	def set_user
  		@user = User.find params[:user_id]
  	end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params(question_id)
      params.require(:question).require(question_id.to_s.to_sym).permit(:user_input, question_option_id: [])
    end
end
