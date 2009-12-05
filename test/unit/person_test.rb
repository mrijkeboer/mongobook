require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class PersonTest < ActiveSupport::TestCase

	#
	# name
	#
	test "ensure length of name within 1..250" do
		person = Person.new

		person.name = nil
		person.valid?
		assert person.errors.invalid?(:name)

		person.name = ''
		person.valid?
		assert person.errors.invalid?(:name)

		person.name = 'x'
		person.valid?
		assert !person.errors.invalid?(:name)

		person.name = 'x' * 250
		person.valid?
		assert !person.errors.invalid?(:name)

		person.name = 'x' * 251
		person.valid?
		assert person.errors.invalid?(:name)
	end


	test "validate uniqueness of name" do
		person1 = Factory.person!
		person2 = Factory.person
		assert !person2.valid?
		assert person2.errors.invalid?(:name)
	end


	#
	# sort_key
	#
	test "ensure length of sort_key within 0..250" do
		person = Person.new

		person.sort_key = nil
		person.valid?
		assert !person.errors.invalid?(:sort_key)

		person.sort_key = ''
		person.valid?
		assert !person.errors.invalid?(:sort_key)

		person.sort_key = 'x' * 250
		person.valid?
		assert !person.errors.invalid?(:sort_key)

		person.sort_key = 'x' * 251
		person.valid?
		assert person.errors.invalid?(:sort_key)
	end


	#
	# search_key
	#
	test "ensure length of search_key within 0..250" do
		person = Person.new

		person.search_key = nil
		person.valid?
		assert !person.errors.invalid?(:search_key)

		person.search_key = ''
		person.valid?
		assert !person.errors.invalid?(:search_key)

		person.search_key = 'x' * 250
		person.valid?
		assert !person.errors.invalid?(:search_key)

		person.search_key = 'x' * 251
		person.valid?
		assert person.errors.invalid?(:search_key)
	end

end
