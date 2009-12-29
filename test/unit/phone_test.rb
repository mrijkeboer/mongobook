require File.dirname(__FILE__) + "/../test_helper"

class PhoneTest < ActiveSupport::TestCase

	#
	# number
	#
	test "ensure length of number within 1..250" do
		phone = Phone.new

		phone.number = nil
		phone.valid?
		assert phone.errors.invalid?(:number)

		phone.number = ''
		phone.valid?
		assert phone.errors.invalid?(:number)

		phone.number = 'x'
		phone.valid?
		assert !phone.errors.invalid?(:number)

		phone.number = 'x' * 250
		phone.valid?
		assert !phone.errors.invalid?(:number)

		phone.number = 'x' * 251
		phone.valid?
		assert phone.errors.invalid?(:number)
	end


	#
	# type
	#
	test "ensure length of type within 1..6" do
		phone = Phone.new

		phone.type = nil
		phone.valid?
		assert phone.errors.invalid?(:type)

		phone.type = ''
		phone.valid?
		assert phone.errors.invalid?(:type)

		phone.type = 'x'
		phone.valid?
		assert !phone.errors.invalid?(:type)

		phone.type = 'x' * 6
		phone.valid?
		assert !phone.errors.invalid?(:type)

		phone.type = 'x' * 7
		phone.valid?
		assert phone.errors.invalid?(:type)
	end

end
