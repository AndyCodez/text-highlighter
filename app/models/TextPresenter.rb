class TextPresenter
	
	def initialize(content:, highlights:)
		@content = content
		@highlights = highlights
	end

	def to_paragraphs
		@content.split(/\s\s/)
	end
end