require 'uglifier'

module Jekyll
  module UglifyFilter
    def uglify(input)
      return input if input.nil? || input.empty?

      begin
        Uglifier.new.compile(input)
      rescue StandardError => e
        puts "Uglify error: #{e.message}"
        input
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::UglifyFilter)
