require 'gmail'
require "rubygems"
require "google_drive"
require_relative 'config_gmail'
require "json"
require 'omniauth-google-oauth2'


def send_email(email,mail_content,mail_subject)
	variables = get_variables
	gmail = Gmail.connect(variables[0], variables[1])
	puts gmail.logged_in?

	gmail.deliver do
	  to email
	  subject mail_subject
	  #text_part do
	  #  body mail_content
	  #end
	  html_part do
	    content_type 'text/html; charset=UTF-8'
	    body "<p>Text of <em>html</em> message.</p>"
	  end
	end

	gmail.logout
end

def get_email_from_spreadsheet(key)
	email_list=[]
	i=2
	session = GoogleDrive::Session.from_config("config.json") #ligne pour se connecter à l'API google drive
	ws = session.spreadsheet_by_key(key).worksheets[0] #ligne pour ouvrir la spreadsheet
	ws.num_rows.times do 
		email_list << ws[i,2]
		i+=1
	end
	return email_list
end

def perform
	spreadsheet_key = "1WNoSQVMPjuOhqOC5cinuhctiR1p5yk4JLq6uyePDFN8"
	#spreadsheet_key = "1PsqSfePTkHpeEKY9DyUKxe9bi_0xcEnaOfMyQd2_bjc"
	email_list = get_email_from_spreadsheet(spreadsheet_key)

	email_list.length.times do |mail_number|
		puts email_list[mail_number]
		content = "Kikou lol la mairie"
		subject = "Yo test #2"
		send_email(email_list[mail_number],content,subject)
	end
	#email = "isabellecorp@gmail.com"
	#content = "Bon je ne sais pas trop quoi raconter, lol."
	#subject = "Mon 6ème test de mail"
	#send_email(email,content,subject)
	
end

perform




