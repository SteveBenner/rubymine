Bundler.setup
require 'nokogiri'

module RubyMineConverter
	# These procedures take an instance of Nokogiri::XML::Element representing the 'root' xml node
	# Example: Nokogiri::XML(file).children[0]
	CONVERTERS = {
		keymap: -> (root) do
			{version: root['version'], name: root['name'], parent: root['parent'],
			 l = a.select {|n| !n.xpath('keyboard-shortcut').empty?}
			}
		end
	}
end