module Aspec
  module Assertions
    def assert(test, msg = 'Test failed')
      unless test then
        backtrace = caller.drop_while { |s| s =~ /#{__FILE__}/ }
        raise RuntimeError, msg, backtrace
      end
    end

    def assert_equal(a, b)
      assert(a == b, "Failed assert_equal #{a} vs #{b}")
    end

    def assert_in_delta(a, b, delta = 0.001)
      assert((a - b).abs <= delta, "Failed assert_in_delta #{a} vs #{b}")
    end
  end
end
