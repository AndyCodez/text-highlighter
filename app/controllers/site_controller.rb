class SiteController < ApplicationController
	before_action :get_content, :get_highlights

  def home
  	@tf = TextPresenter.new(content: @content, highlights: @highlights)
  	# @paragraphs = tf.to_paragraphs
  	@highlighted = @tf.highlight_text
  end

  private
  # x, x, foobar, foobar, barbaz, barbaz, baz
  def get_content
	@content = <<~HTML
		This is the 1st paragraph. Some additional test text to increase.
		
		This is the 2nd paragraph and it goes like this etal.
		
		This is the 3rd paragraph. This is the 3rd paragraph. This is the 3rd paragraph.

		This is the 4th paragraph and it goes like.

	HTML
  end

  def get_highlights
	@highlights = [
					{start: 2, end: 3, comment: "foo"}, 
					{start: 2, end: 5, comment: "bar"}, 
					{start: 4, end: 20, comment: "baz"}
				]  	
  end
end
