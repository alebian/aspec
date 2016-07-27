require_relative 'reporter'
require_relative 'assertions'

module Aspec
  class Test
    include Assertions
    attr_reader :failure, :name
    alias failure? failure

    TESTS = []

    def initialize(name)
      @failure = false
      @name = name
    end

    def self.test_names
      public_instance_methods.grep(/_test$/)
    end

    def self.run(reporter)
      test_names.shuffle.each do |name|
        exception = self.new(name).run
        reporter << exception
      end
    end

    def run
      send(name)
      false
    rescue => exception
      @failure = exception
    ensure
      return self
    end

    def self.run_all
      reporter = Aspec::Reporter.new
      TESTS.each do |klass|
        klass.run(reporter)
      end
      reporter.summary
    end

    def self.inherited(klass)
      TESTS << klass
    end
  end
end
