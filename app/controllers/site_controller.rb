class SiteController < ApplicationController
	before_action :get_content, :get_highlights

  def home
  	@text_presenter = TextPresenter.new(content: @content, highlights: @highlights)
  	@highlighted_text = @text_presenter.highlighted
  end

  private

  def get_content
		@content = <<~HTML
			This is the 1st paragraph. Some additional test text to increase.

			This is the 1st paragraph. Some additional test text to increase. Duplicated.
			
			This is the 2nd paragraph and it goes like this etal.
			
			This is the 3rd paragraph. This is the 3rd paragraph. This is the 3rd paragraph.

			This is the 4th paragraph and it goes like.

		HTML
  end

  def get_highlights
	@highlights = [
					{start: 1, end: 4, comment: "foo"}, 
					{start: 2, end: 5, comment: "bar"}, 
					{start: 4, end: 20, comment: "baz"},
					{start: 3, end: 6, comment: "chaz"}
				]  	
  end
end
