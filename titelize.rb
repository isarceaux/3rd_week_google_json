def titleize(title) #WIP
	new_title = ""

	title.split.each do |word|
		if new_title == ""
			new_title << word.capitalize
		elsif ["et", "sur", "le", "en","les","la","sous","dit","l","aux","1","2","3","4","5","6","7","8","9"].include? word.downcase
			new_title << " "
			new_title << word.downcase
		else	
			new_title << " "
			new_title << word.capitalize
		end
	end

	return new_title
end