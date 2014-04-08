require 'minitest'
require 'forwardable'

module Minitest
  def self.plugin_redgreen_options(opts, options)
  end

  def self.plugin_redgreen_init(options)
    io = Redgreen.new(options[:io])
    self.reporter.reporters.grep(Minitest::Reporter).each do |r|
      r.io = io
    end
  end

  class Redgreen
    extend Forwardable

    BEGIN_ESCAPE = "\e["
    END_ESCAPE = "#{BEGIN_ESCAPE}0m"

    attr_reader :io

    def initialize(io)
      @io = io
    end

    def print(o)
      case o
      when '.' then
        io.print passing(o)
      when 'F'
        io.print failing(o)
      when 'E'
        io.print erring(o)
      when 'S'
        io.print skipping(o)
      else
        io.print o
      end
    end

    def puts(o=nil)
      return io.puts if o.nil?

      io.puts o
        .gsub(/\b ((\d+) \s+ runs?) \b/x) { pluralize($1) }
        .gsub(/\b ((\d+) \s+ assertions?) \b/x) { pluralize($1) }
        .gsub(/\b ((\d+) \s+ failures?) \b/x) { Integer($2) > 0 ? failing(pluralize($1)) : passing(pluralize($1)) }
        .gsub(/\b ((\d+) \s+ errors?)   \b/x) { Integer($2) > 0 ? erring(pluralize($1))  : passing(pluralize($1)) }
        .gsub(/\b ((\d+) \s+ skips?)    \b/x) { Integer($2) > 0 ? skipping(pluralize($1)): passing(pluralize($1)) }
    end

    delegate [:sync, :sync=] => :io

    private

    def pluralize(input)
      text = input.split(" ")
      word = text[0].to_i == 1 ? "#{text[0]} #{text[1][0..-2]}" : "#{text[0]} #{text[1]}"
    end
    
    def failing(o); escape('31m') {o}; end
    def passing(o); escape('32m') {o}; end
    def skipping(o); escape('33m') {o}; end
    def erring(o);  escape('35m') {o}; end

    def escape(sequence)
      "\e[#{sequence}" << yield << "\e[0m"
    end
  end
end
