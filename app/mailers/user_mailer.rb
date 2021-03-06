class UserMailer < ActionMailer::Base
	default from: "Bike!Bike! <noreply@bikebike.org>"

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.user_mailer.activation_needed_email.subject
	#
	def activation_needed_email(email_address)
		@greeting = "Hi"

		mail to: 'goodgodwin@hotmail.com'
	end

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.user_mailer.activation_success_email.subject
	#
	def activation_success_email
		@greeting = "Hi"

		mail to: "to@example.org"
	end

    def conference_registration_email(conference, data, conference_registration)
        @data = data
        @conference = conference
        @url = "https://bikebike.org"#UserMailer.default_url_options[:host]
        @confirmation_url = UserMailer.default_url_options[:host] + "/#{@conference.url}/register/confirm/#{conference_registration.confirmation_token}/".gsub(/\/\/+/, '/')
        mail to: data[:email], subject: (_'register.email.registration.subject',"Please confirm your registration for #{conference.title}", vars: {:conference_title => conference.title})
    end

	def conference_registration_confirmed_email(conference, data, conference_registration)
		@data = data
		@conference = conference
		@url = "https://bikebike.org"#UserMailer.default_url_options[:host]
		@confirmation_url = UserMailer.default_url_options[:host] + "/#{@conference.url}/register/pay-registration/#{conference_registration.confirmation_token}/".gsub(/\/\/+/, '/')
		mail to: data[:email], subject: (_'register.email.registration_confirmed.subject',"Thanks for confirming your registration for #{conference.title}", vars: {:conference_title => conference.title})
	end
end
