#!/usr/bin/env ruby
#
# This script generates and outputs the XML for a RubyMine File Watcher configuration
#
# There are 2 arguments:
#   $1 - Path to a YAML file containing one or more watcher configurations (see README for schema info)
#   $2 - [OPTIONAL] Alternative configuration to emit instead of import/export (either 'app' or 'project')
#
require 'yaml'
require 'pathname'
require 'ostruct'
require 'bundler'
Bundler.setup
require 'slim/logic_less'

# The heavy work is done by Slim templates - Slim is pretty fantastic for generating XML
Slim::Engine.set_options encoding: 'utf-8', format: :xml, pretty: true

TEMPLATE1 = Pathname('~/github/rubymine/file-watchers/file-watchers.slim').expand_path
TEMPLATE2 = Pathname('~/github/rubymine/file-watchers/file-watcher-config.slim').expand_path
WATCHERS = YAML.load_file(Pathname(ARGV[0]).expand_path)
CONFIG_TYPE = ARGV[1] || :bare # Default to :bare configuration (for import/export)

# todo: replace this data massaging crap with an fancier Slim template

# In order to convert a flat data structure into the appropriate XML some data massaging is necessary
WATCHERS.each do |w|
  # Basically what this code does is to isolate collections and re-assign them as per proper XML structure
  w['options'] = w.collect { |k,v| {name: k, value: v} unless %w[envs outputFilters enabled].include?(k) }
  # Iteration here would cause multiple <array> nodes to be created, so store data as a Hash instead
  w['outputFilters'] = {
    filters: w['outputFilters'].collect { |f| {filter_opts: f.collect { |k,v| {name: k, value: v} }} }
  } if w['outputFilters']
  w['envs'] = {
    env: w['envs'].collect { |k,v| {name: k, value: v} }
  } if w['envs']
end

dict = {watchers: WATCHERS}
xml = Slim::Template.new(TEMPLATE1, logic_less: true).render dict
dict = OpenStruct.new rendered_file_watchers: xml, config_for: CONFIG_TYPE
puts Slim::Template.new(TEMPLATE2, logic_less: false).render dict
