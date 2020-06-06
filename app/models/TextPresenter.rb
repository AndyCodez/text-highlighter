class TextPresenter
	
	def initialize(content:, highlights:)
		@content = content
		@highlights = highlights
	end

	def to_paragraphs
		@content.split(/\s\s/)
	end

	def highlight_text

		all_answers = []

		highlights_hash = {}

		@highlights.each do |highlight|
			highlights_hash["#{highlight[:start]}-#{highlight[:end]}"] = "#{highlight[:comment]}"
		end
		# highlights_hash = {"2-9"=>"foo", "4-12"=>"bar", "7-20"=>"baz"}
		
		highlights_keys = highlights_hash.keys
		# ["2-9", "4-12", "7-20"]

		printed_paragraph = "<p>"

		to_paragraphs.each do |paragraph|
			answer = []
			paragraph_words = paragraph.split
			word_indices = paragraph_words.each_with_index.map {|word, position| position}
			# word_indices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

			word_indices.each do |word_index|
				comment = ""
    		for key in highlights_keys

    			key_start, key_end = key.split("-")
					if word_index.between?(key_start.to_i, key_end.to_i)
						comment += highlights_hash[key]
						printed_paragraph << "<span class='tooltip'>#{paragraph_words[word_index]}<span class='tooltiptext'>#{comment}</span></span>"
					else
						printed_paragraph << paragraph_words[word_index]
					end
				end

    		comment += word_index.to_s if comment == ""
    		answer.push(comment)
    		paragraph_words.push("</p>")
			end
			all_answers.push(answer)	
		end

		printed_paragraph

		# results = []
		# to_paragraphs.each do |raw_paragraph|
		# 	all_answers.each do |ans_paragraph|
		# 		results << Hash[raw_paragraph.downcase.split.zip(ans_paragraph)]
		# 	end
		# end


		# results.each do |result|
		# 	result_keys = result.keys
		# 	result_keys.each do |rk|
		# 		if rk == "0" || rk.to_i != 0
		# 			debugger
		# 		else
		# 		end
		# 	end
		# end
		# debugger
		# all_answers.each do |paragraph|
		# 	paragraph.each do |word|
		# 		# not highlighted
		# 		if word == "0" || word.to_i != 0
		# 			"<p>#{and}is a p</p>"
					
		# 		else

		# 		end
		# 	end
		# end

	end
end