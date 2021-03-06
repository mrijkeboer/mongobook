require File.expand_path("../../test_helper", __FILE__)

class ContactTest < ActiveSupport::TestCase

	#
	# name
	#
	test "ensure length of name within 1..250" do
		contact = Contact.new

		contact.name = nil
		contact.valid?
		assert contact.errors.invalid?(:name)

		contact.name = ''
		contact.valid?
		assert contact.errors.invalid?(:name)

		contact.name = 'x'
		contact.valid?
		assert !contact.errors.invalid?(:name)

		contact.name = 'x' * 250
		contact.valid?
		assert !contact.errors.invalid?(:name)

		contact.name = 'x' * 251
		contact.valid?
		assert contact.errors.invalid?(:name)
	end


	#
	# sort_key
	#
	test "ensure length of sort_key within 0..250" do
		contact = Contact.new

		contact.sort_key = nil
		contact.valid?
		assert !contact.errors.invalid?(:sort_key)

		contact.sort_key = ''
		contact.valid?
		assert !contact.errors.invalid?(:sort_key)

		contact.sort_key = 'x' * 250
		contact.valid?
		assert !contact.errors.invalid?(:sort_key)

		contact.sort_key = 'x' * 251
		contact.valid?
		assert contact.errors.invalid?(:sort_key)
	end


	test "ensure sort_key is set before saving" do
		contact = Factory.contact
		assert contact.sort_key.to_s.length == 0

		contact.save
		assert contact.sort_key.to_s.length > 0
	end


	#
	# search_key
	#
	test "ensure length of search_key within 0..250" do
		contact = Contact.new

		contact.search_key = nil
		contact.valid?
		assert !contact.errors.invalid?(:search_key)

		contact.search_key = ''
		contact.valid?
		assert !contact.errors.invalid?(:search_key)

		contact.search_key = 'x' * 250
		contact.valid?
		assert !contact.errors.invalid?(:search_key)

		contact.search_key = 'x' * 251
		contact.valid?
		assert contact.errors.invalid?(:search_key)
	end


	test "ensure search_key is set before saving" do
		contact = Factory.contact
		assert contact.search_key.to_s.length == 0
		
		contact.save
		assert contact.search_key.to_s.length > 0
	end

end
