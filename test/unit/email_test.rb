require File.dirname(__FILE__) + "/../test_helper"

class EmailTest < ActiveSupport::TestCase

	#
	# address
	#
	test "ensure length of address within 1..250" do
		email = Email.new

		email.address = nil
		email.valid?
		assert email.errors.invalid?(:address)

		email.address = ''
		email.valid?
		assert email.errors.invalid?(:address)

		email.address = 'x'
		email.valid?
		assert !email.errors.invalid?(:address)

		email.address = 'x' * 250
		email.valid?
		assert !email.errors.invalid?(:address)

		email.address = 'x' * 251
		email.valid?
		assert email.errors.invalid?(:address)
	end

end
