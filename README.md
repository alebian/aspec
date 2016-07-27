# Aspec

Minimalistic Ruby test suite

## Usage

```ruby
require_relative 'aspec'

class Test < Aspec::Test
  def assert_test
    assert(1 == 1)
  end

  def assert_equal_test
    assert_equal(1, 1)
  end

  def assert_in_delta_test
    assert_in_delta(0.01, 0.01)
  end

  def assert_fail_test
    assert(1 == 2)
  end

  def assert_equal_fail_test
    assert_equal(1, 2)
  end

  def assert_in_delta_fail_test
    assert_in_delta(0.01, 0.02)
  end
end

Aspec::Test.run_all
```
