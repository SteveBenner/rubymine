Bundler.setup
require 'nokogiri'

module RubyMineConverter
	# *Converters* are the essence of RMC - Lambdas which take as their only argument an instance of
	# {Nokogiri::XML::Element} that represents the root node of a RubyMine XML configuration element.
	# The purpose of a *converter* is to allow output a data structure which is ideal for both processing
	# and viewing (in YAML) by the human eye. Example of a valid input: Nokogiri::XML(file).children[0]
	CONVERTERS = {
		keymap: -> (root) do
			{version: root['version'], name: root['name'], parent: root['parent'], mappings:
			 l = a.select {|n| !n.xpath('keyboard-shortcut').empty?}
			}
		end
	}
end