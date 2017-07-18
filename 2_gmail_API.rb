require 'gmail'
#require 'gmail_xoauth'
require_relative 'config_gmail'
require "json"
#require 'client_id.json'
require 'omniauth-google-oauth2'


variables = get_variables
gmail = Gmail.connect(variables[0], variables[1])
puts gmail.logged_in?

gmail.deliver do
  to "isabellecorp@gmail.com"
  subject "Mon deuxième test d'envoi de mail avec l'API depuis Marie Lucette!"
  text_part do
    body "Bon je ne sais pas trop quoi raconter, lol."
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>"
  end
end

gmail.logout




