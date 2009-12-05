require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class ContactMethodTest < ActiveSupport::TestCase

	#
	# name
	#
	test "ensure length of name within 1..250" do
		method = ContactMethod.new

		method.name = nil
		method.valid?
		assert method.errors.invalid?(:name)

		method.name = ''
		method.valid?
		assert method.errors.invalid?(:name)

		method.name = 'x'
		method.valid?
		assert !method.errors.invalid?(:name)

		method.name = 'x' * 250
		method.valid?
		assert !method.errors.invalid?(:name)

		method.name = 'x' * 251
		method.valid?
		assert method.errors.invalid?(:name)
	end


	#
	# value
	#
	test "ensure length of value in 1..250" do
		method = ContactMethod.new

		method.value = nil
		method.valid?
		assert method.errors.invalid?(:value)

		method.value = ''
		method.valid?
		assert method.errors.invalid?(:value)

		method.value = 'x'
		method.valid?
		assert !method.errors.invalid?(:value)

		method.value = 'x' * 250
		method.valid?
		assert !method.errors.invalid?(:value)

		method.value = 'x' * 251
		method.valid?
		assert method.errors.invalid?(:value)
	end

end
