# Generates the colors
class Color
	def self.get_color
		"#" + Random.bytes(3).unpack1('H*')
	end
end