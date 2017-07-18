require 'gmail'
#require 'gmail_xoauth'
require_relative 'config_gmail'
require "json"
#require 'client_id.json'
require 'omniauth-google-oauth2'

variables = get_variables

gmail = Gmail.connect(:xoauth2,variables[0], variables[1])
# play with your gmail...

gmail.deliver do
  to "etienne@gmx.fr"
  subject "Mon premier test d'envoi de mail avec l'API!"
  text_part do
    body "Bon je ne sais pas trop quoi raconter, lol."
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>"
  end
  add_file "/path/to/some_image.jpg"
end


gmail.logout

