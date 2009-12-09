require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class InstantMessagingTest < ActiveSupport::TestCase

	#
	# account
	#
	test "ensure length of account within 1..250" do
		im = InstantMessaging.new

		im.account = nil
		im.valid?
		assert im.errors.invalid?(:account)

		im.account = ''
		im.valid?
		assert im.errors.invalid?(:account)

		im.account = 'x'
		im.valid?
		assert !im.errors.invalid?(:account)

		im.account = 'x' * 250
		im.valid?
		assert !im.errors.invalid?(:account)

		im.account = 'x' * 251
		im.valid?
		assert im.errors.invalid?(:account)
	end


	#
	# type
	#
	test "ensure length of type within 1..250" do
		im = InstantMessaging.new

		im.type = nil
		im.valid?
		assert im.errors.invalid?(:type)

		im.type = ''
		im.valid?
		assert im.errors.invalid?(:type)

		im.type = 'x'
		im.valid?
		assert !im.errors.invalid?(:type)

		im.type = 'x' * 250
		im.valid?
		assert !im.errors.invalid?(:type)

		im.type = 'x' * 251
		im.valid?
		assert im.errors.invalid?(:type)
	end

end
