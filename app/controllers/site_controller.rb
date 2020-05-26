class SiteController < ApplicationController
	before_action :get_content, :get_highlights

  def home
  	tf = TextPresenter.new(content: @content, highlights: @highlights)
  	@paragraphs = tf.to_paragraphs
  end

  private
  
  def get_content
	@content = <<~HTML
		This is the 1st paragraph. This is the 1st paragraph. This is the 1st paragraph.
		
		This is the 2nd paragraph. This is the 2nd paragraph. This is the 2nd paragraph.
		
		This is the 3rd paragraph. This is the 3rd paragraph. This is the 3rd paragraph.
	HTML
  end

  def get_highlights
	@highlights = [
					{start: 2, end: 9, comment: "foo"}, 
					{start: 4, end: 12, comment: "bar"}, 
					{start: 7, end: 20, comment: "baz"}
				]  	
  end
end
