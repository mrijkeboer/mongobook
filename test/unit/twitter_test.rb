require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class TwitterTest < ActiveSupport::TestCase

	#
	# username
	#
	test "ensure length of username within 1..250" do
		twitter = Twitter.new

		twitter.username = nil
		twitter.valid?
		assert twitter.errors.invalid?(:username)

		twitter.username = ''
		twitter.valid?
		assert twitter.errors.invalid?(:username)

		twitter.username = 'x'
		twitter.valid?
		assert !twitter.errors.invalid?(:username)

		twitter.username = 'x' * 250
		twitter.valid?
		assert !twitter.errors.invalid?(:username)

		twitter.username = 'x' * 251
		twitter.valid?
		assert twitter.errors.invalid?(:username)
	end

end
