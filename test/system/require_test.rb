require 'simplecov'
SimpleCov.start

require_relative '../test_helper'

# Tests for System::Require
module SystemServices
  class RequireTest < Minitest::Test
    context 'system require tests' do
      should 'test buh' do
        puts "test"
      end
    end
  end
end
