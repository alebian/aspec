module Aspec
  class Reporter
    attr_reader :failures

    def initialize
      @failures = []
    end

    def << result
      unless result.failure? then
        print '.'
      else
        print 'F'
        @failures << result
      end
    end

    def summary
      puts
      @failures.each do |result|
        puts
        puts "Failure: #{result.class}##{result.name}: #{result.failure.message}"
        puts "  #{result.failure.backtrace.first}"
      end
    end
  end
end
