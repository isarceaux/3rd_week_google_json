require "rubygems"
require "google_drive"
require "json"
require_relative "1_route_de_la_mairie"

def setup_spreadsheet
	session = GoogleDrive::Session.from_config("config.json")
	ws = session.spreadsheet_by_key("1Cy87fQ3hsZAuDPvmzIHxi5UfFc1OmKGXiISlM-V8EGs").worksheets[0]
end

def get_the_hash_that_I_scrapped_few_days_ago
	return get_emails_from_val_doise
end

def put_data_in_spreadsheet(hash_towns)
	setup_spreadsheet
	towns = hash_towns.keys
	i=1
	towns.each do |town|
		ws[i, 1] = town
		ws[i, 2] = hash_towns[town]
		ws.save
		i+=1
	end
end

def put_data_in_json(hash_towns)
	File.open("results/town_scrapping.json","w") do |f|
		f.write(hash_towns.to_json)
	end
end

def perform
	hash_towns = get_the_hash_that_I_scrapped_few_days_ago
	#put_data_in_spreadsheet(hash_towns)
	put_data_in_json(hash_towns)
end