class TextPresenter
	
	def initialize(content:, highlights:)
		@content = content
		@highlights = highlights
	end

	def paragraphs
		@content.split(/\s\s/)
	end

	def highlight
		display_text = "<p>"

		tooltiptext = ""

		@highlights.each do |highlight|
			color = "#" + Random.bytes(3).unpack1('H*')

			sentence = []

			paragraphs.each do |paragraph|
				split_content = paragraph.split
				word_indices = split_content.each_with_index.map {|word, position| position}

				word_indices.each do |word_index|
					words = ""	
					
					if word_index.between?(highlight[:start], highlight[:end])
			
						tooltiptext += highlight[:comment] unless tooltiptext.include?(highlight[:comment])
			
						words += "<span class='tooltip' style='background-color: #{color}'>
											#{split_content[word_index]}
											<span class='tooltiptext'>#{tooltiptext}</span></span>"
					end
	    
	    		words += split_content[word_index] if words == ""
	  			sentence.push(words)
				end
			end

			sentence.each do |word|
				display_text << "#{word} "
			end

			display_text << "</p>"
		end	

		display_text
	end
end
