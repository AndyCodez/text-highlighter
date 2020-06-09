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
				sentence = ""	
				tooltiptext = ""

				word = split_paragraph[word_index]

				@highlights.each do |highlight|

					if word_index.between?(highlight[:start], highlight[:end])
			
						tooltiptext += highlight[:comment] 

						sentence = "<span class='tooltip' style='background-color: #{highlight[:color]}'>
											#{word}
											<span class='tooltiptext'>#{tooltiptext}</span></span>"
						sentence += " "
					end
	    	end
    		
    		sentence += "#{word} " if sentence == ""
  			display_text << "#{sentence} "
			end

			display_text << "</p>"
		end
		display_text
	end

	def add_colors
		@highlights.each do |highlight|
			highlight[:color] = Color.get_color
		end		
	end

end

class Color
	def self.get_color
		"#" + Random.bytes(3).unpack1('H*')
	end
end