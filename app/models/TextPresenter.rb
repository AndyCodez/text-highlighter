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

		color = "#" + Random.bytes(3).unpack1('H*')

		paragraphs.each do |paragraph|
			split_paragraph = paragraph.split
			word_indices = split_paragraph.each_with_index.map {|word, position| position}
			
			word_indices.each do |word_index|
				words = ""	
				tooltiptext = ""

				@highlights.each do |highlight|

					if word_index.between?(highlight[:start], highlight[:end])
			
						tooltiptext += highlight[:comment] 

						words = "<span class='tooltip' style='background-color: #{color}'>
											#{split_paragraph[word_index]}
											<span class='tooltiptext'>#{tooltiptext}</span></span>"
						words += " "
					end
	    	end
    		
    		words += "#{split_paragraph[word_index]} " if words == ""
  			display_text << "#{words} "
			end

			display_text << "</p>"
		end
		display_text
	end
end
