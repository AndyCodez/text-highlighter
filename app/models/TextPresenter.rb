class TextPresenter
	
	def initialize(content:, highlights:)
		@content = content
		@highlights = highlights
	end

	def paragraphs
		@content.split(/\s\s/)
	end

	def highlighted
		display_text = "<p>"

		add_colors

		paragraphs.each do |paragraph|
			split_paragraph = paragraph.split
			word_indices = split_paragraph.each_with_index.map {|word, position| position}
			
			word_indices.each do |word_index|
				words = ""	
				tooltiptext = ""

				@highlights.each do |highlight|

					if word_index.between?(highlight[:start], highlight[:end])
			
						tooltiptext += highlight[:comment] 

						words = "<span class='tooltip' style='background-color: #{highlight[:color]}'>
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

	def add_colors
		@highlights.each do |highlight|
			color = "#" + Random.bytes(3).unpack1('H*')
			highlight[:color] = color
		end		
	end
end
