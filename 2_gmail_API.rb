require 'gmail'
require_relative 'config_gmail'

gmail = Gmail.connect(username, password)
# play with your gmail...

puts .inbox.count

gmail.logout

