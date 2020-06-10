# Displays highlighted paragraphs
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

		highlight_colors = {}

		paragraphs.each do |paragraph|
			split_paragraph = paragraph.split
			word_indices = split_paragraph.each_with_index.map {|word, position| position}
			
			word_indices.each do |word_index|
				options = { word_index: word_index, 
										split_paragraph: split_paragraph, 
										highlight_colors: highlight_colors, 
										display_text: display_text}
				
				check_for_highlights(options)

			end

			display_text << "</p>"
		end
		display_text
	end

	private

	def check_for_highlights(options)
		word_index = options[:word_index]
		split_paragraph = options[:split_paragraph]
		highlight_colors = options[:highlight_colors]
		display_text = options[:display_text]

		sentence = ""	
		tooltiptext = ""

		word = split_paragraph[word_index]

		@highlights.each do |highlight|
			
			if word_index.between?(highlight[:start], highlight[:end])
	
				tooltiptext += highlight[:comment] 

				highlight_colors[tooltiptext] = Color.get_color unless highlight_colors[tooltiptext].present?

				color = highlight_colors[tooltiptext]

				sentence = "<span class='tooltip' style='background-color: #{color}'>
									#{word}
									<span class='tooltiptext'>#{tooltiptext}</span></span>"
				sentence += " "
			end
		end
		
	 	sentence += "#{word} " if sentence == ""	
		display_text << "#{sentence} "
	end
end

