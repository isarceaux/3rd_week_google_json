require "rubygems"
require "google_drive"
require "json"

require_relative "1_route_de_la_mairie"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
#session = GoogleDrive::Session.from_config("config.json")

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
# https://docs.google.com/spreadsheets/d/1Cy87fQ3hsZAuDPvmzIHxi5UfFc1OmKGXiISlM-V8EGs/edit?usp=drive_web
#ws = session.spreadsheet_by_key("1Cy87fQ3hsZAuDPvmzIHxi5UfFc1OmKGXiISlM-V8EGs").worksheets[0]


def perform1
	hash_towns = get_emails_from_val_doise
	towns = hash_towns.keys
	session = GoogleDrive::Session.from_config("config.json")
	ws = session.spreadsheet_by_key("1Cy87fQ3hsZAuDPvmzIHxi5UfFc1OmKGXiISlM-V8EGs").worksheets[0]
	i=1
	towns.each do |town|
		ws[i, 1] = town
		ws[i, 2] = hash_towns[town]
		ws.save
		i+=1
	end
end

perform2()