require 'rails_helper'

RSpec.describe TextPresenter, type: :model do
	describe '#paragraphs' do  
		it "converts a string of text to HTML paragraphs" do
			 
			content = <<~HTML
				This is the 1st paragraph. This is the 1st paragraph. This is the 1st paragraph.
				
				This is the 2nd paragraph. This is the 2nd paragraph. This is the 2nd paragraph.
				
				This is the 3rd paragraph. This is the 3rd paragraph. This is the 3rd paragraph.
			HTML

			highlights = [{start: 2, end: 9, comment: "foo"}, {start: 4, end: 12, comment: "bar"}, 
										{start: 7, end: 20, comment: "baz"}]

			text_presenter = TextPresenter.new(content: content, highlights: highlights)
			
			expect(text_presenter.paragraphs.count).to eq(3)
		end
	end
end
