class UserNotifier < ApplicationMailer
	default from: 'contato@nicestart.com'

	def send_form(user, form)
		@user = user
		@form = form

		mail(:to => @user.email, :subject => 'Formulário de triagem')
	end
end
