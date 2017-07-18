require 'gmail'
#require 'gmail_xoauth'
require_relative 'config_gmail'
require "json"
#require 'client_id.json'
require 'omniauth-google-oauth2'


def send_email(email,mail_content,mail_subject)
	variables = get_variables
	gmail = Gmail.connect(variables[0], variables[1])
	puts gmail.logged_in?

	gmail.deliver do
	  to email
	  subject mail_subject
	  text_part do
	    body mail_content
	  end
	  #html_part do
	  #  content_type 'text/html; charset=UTF-8'
	  #  body "<p>Text of <em>html</em> message.</p>"
	  #end
	end

	gmail.logout
end

def perform
	email = "isabellecorp@gmail.com"
	content = "Bon je ne sais pas trop quoi raconter, lol."
	subject = "Mon 6ème test de mail"
	send_email(email,content,subject)
end

perform




