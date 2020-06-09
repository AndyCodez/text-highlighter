require 'rails_helper'

RSpec.describe TextPresenter, type: :model do
	describe '#to_paragraphs' do  
		it "converts a string of text to HTML paragraphs" do
			 
			content = <<~HTML
				This is the 1st paragraph. This is the 1st paragraph. This is the 1st paragraph.
				
				This is the 2nd paragraph. This is the 2nd paragraph. This is the 2nd paragraph.
				
				This is the 3rd paragraph. This is the 3rd paragraph. This is the 3rd paragraph.
			HTML

			highlights = [{start: 2, end: 9, comment: "foo"}, {start: 4, end: 12, comment: "bar"}, 
										{start: 7, end: 20, comment: "baz"}]

			text_presenter = TextPresenter.new(content: content, highlights: highlights)
			
			expect(text_presenter.to_paragraphs.count).to eq(3)
		end
	end

	# describe '#highlight_text' do  
	# 	include RSpecHtmlMatchers

	# 	it "highlights words with tooltips based on the indices" do
	# 		content = <<~HTML
	# 			This is the 1st paragraph. This is the 1st paragraph. This is the 1st paragraph.
				
	# 			This is the 2nd paragraph. This is the 2nd paragraph. This is the 2nd paragraph.
				
	# 			This is the 3rd paragraph. This is the 3rd paragraph. This is the 3rd paragraph.
	# 		HTML

	# 		highlights = [{start: 2, end: 9, comment: "foo"}, {start: 4, end: 12, comment: "bar"}, 
	# 									{start: 7, end: 15, comment: "baz"}]

	# 		tf = TextPresenter.new(content: content, highlights: highlights)

	# 		paragraph = tf.to_paragraphs.sample
	# 		paragraph_words = paragraph.split

	# 		# expect(paragraph_words[3]).to have_tag('span.tooltiptext', :text => 'foo')
	# 		# expect(paragraph_words[4]).to have_tag('span.tooltiptext', :text => 'foobar')
	# 		# expect(paragraph_words[7]).to have_tag('span.tooltiptext', :text => 'foobarbaz')

	# 		expect(rendered).to have_tag('span.tooltiptext', :text => 'foo')

	# 	end		
	# end		
end
