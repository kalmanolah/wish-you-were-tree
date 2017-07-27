#!/usr/bin/env ruby
require 'erb'
require 'ostruct'
require_relative 'config.rb'

# Magic ERB-rendering class
# Taken from http://stackoverflow.com/a/8955121 (thanks buddy)
class ErbalT < OpenStruct
    def self.render_from_hash(t, h)
        ErbalT.new(h).render(t)
    end

    def render(template)
        ERB.new(template).result(binding)
    end
end

# Iterate over all .erb files in the hiera/ dir
Dir[File.dirname(__FILE__) + '/../code/environments/*/data/**/*.erb'].each do |file|
    # Grab raw template contents
    template = File.open(file, 'rb') { |f| f.read }

    # Render template using config hash
    rendered = ErbalT::render_from_hash(template, $config)

    # Determine new filename (without the .erb)
    new_file = file.gsub(/\.erb$/, '')

    # Save rendered contents as new file
    File.open(new_file, 'w') { |f| f.write(rendered) }
end
