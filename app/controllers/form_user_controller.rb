class FormUserController < ApplicationController
	before_action :set_form, :set_user
  layout 'front-form'
  def show
  end

  private
  	def set_form
  		@form = Form.find params[:form_id]
  	end

  	def set_user
  		@user = User.find params[:user_id]
  	end
end
