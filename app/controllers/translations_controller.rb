class TranslationsController < ApplicationController
	def translate
		message = params[:Body]
		
		if message.nil? || message.empty?
			message = params[:message]
		end

		unless message.nil? || message.empty?
			require 'mechanize'
			a = Mechanize.new do |agent|
				agent.user_agent_alias = 'Mac Safari'
			end

			a.get('http://transl8it.com/')
			form = a.page.forms.first
			form.txtMessage = message
			form.submit
			# form being submitted
			@result = a.page.forms.first.txtTranslation
			@bad = @result == message
		end

		respond_to do |format|
			format.html
			format.xml
		end
	end
end
