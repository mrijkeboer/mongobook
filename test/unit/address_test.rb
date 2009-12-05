require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class AddressTest < ActiveSupport::TestCase

	#
	# address
	#
	test "ensure length of address within 0..250" do
		address = Address.new

		address.address = nil
		address.valid?
		assert !address.errors.invalid?(:address)

		address.address = ''
		address.valid?
		assert !address.errors.invalid?(:address)

		address.address = 'x' * 250
		address.valid?
		assert !address.errors.invalid?(:address)

		address.address = 'x' * 251
		address.valid?
		assert address.errors.invalid?(:address)
	end


	#
	# zipcode
	#
	test "ensure length of zipcode within 0..250" do
		address = Address.new

		address.zipcode = nil
		address.valid?
		assert !address.errors.invalid?(:zipcode)

		address.zipcode = ''
		address.valid?
		assert !address.errors.invalid?(:zipcode)

		address.zipcode = 'x' * 250
		address.valid?
		assert !address.errors.invalid?(:zipcode)

		address.zipcode = 'x' * 251
		address.valid?
		assert address.errors.invalid?(:zipcode)
	end


	#
	# city
	#
	test "ensure length of city within 0..250" do
		address = Address.new

		address.city = nil
		address.valid?
		assert !address.errors.invalid?(:city)

		address.city = ''
		address.valid?
		assert !address.errors.invalid?(:city)

		address.city = 'x' * 250
		address.valid?
		assert !address.errors.invalid?(:city)

		address.city = 'x' * 251
		address.valid?
		assert address.errors.invalid?(:city)
	end


	#
	# country
	#
	test "ensure length of country within 0..250" do
		address = Address.new

		address.country = nil
		address.valid?
		assert !address.errors.invalid?(:country)

		address.country = ''
		address.valid?
		assert !address.errors.invalid?(:country)

		address.country = 'x' * 250
		address.valid?
		assert !address.errors.invalid?(:country)

		address.country = 'x' * 251
		address.valid?
		assert address.errors.invalid?(:country)
	end

end
