require 'rails_helper'

RSpec.describe "site/home.html.erb", type: :view do
	describe '#highlight_text' do  
		include RSpecHtmlMatchers

		it "highlights words with tooltips based on the indices" do
			assign(:paragraphs, ["This is the 1st paragraph. This is the 1st paragraph. This is the 1st paragraph.",
				"This is the 2nd paragraph. This is the 2nd paragraph. This is the 2nd paragraph.",
				"This is the 3rd paragraph. This is the 3rd paragraph. This is the 3rd paragraph."])

			

			# highlights = [{start: 2, end: 9, comment: "foo"}, {start: 4, end: 12, comment: "bar"}, 
			# 							{start: 7, end: 15, comment: "baz"}]

			# tf = TextPresenter.new(content: content, highlights: highlights)

			# paragraph = tf.to_paragraphs.sample
			# paragraph_words = paragraph.split

			# expect(paragraph_words[3]).to have_tag('span.tooltiptext', :text => 'foo')
			# expect(paragraph_words[4]).to have_tag('span.tooltiptext', :text => 'foobar')
			# expect(paragraph_words[7]).to have_tag('span.tooltiptext', :text => 'foobarbaz')

			expect(rendered).to have_tag('span.tooltiptext', :text => 'foo')

		end		
	end		
end
