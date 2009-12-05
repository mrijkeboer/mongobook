require File.dirname(__FILE__) + "/../test_helper"
require File.dirname(__FILE__) + "/../factory"

class UserTest < ActiveSupport::TestCase

	#
	# username
	#
	test "validate presence of username" do
		user = User.new(:username => nil)
		assert !user.valid?
		assert user.errors.invalid?(:username)
	end


	test "validate uniqueness of username" do
		user1 = Factory.user!
		user2 = Factory.user
		assert !user2.valid?
		assert user2.errors.invalid?(:username)
	end


	test "ensure length of username within 3..250" do
		user = User.new
		user.username = 'x' * 2
		user.valid?
		assert user.errors.invalid?(:username)

		user.username = 'x' * 3
		user.valid?
		assert !user.errors.invalid?(:username)

		user.username = 'x' * 250
		user.valid?
		assert !user.errors.invalid?(:username)

		user.username = 'x' * 251
		user.valid?
		assert user.errors.invalid?(:username)
	end


	test "validate immutability of username" do
		user = Factory.user!(:username => 'firstname')
		user.username = 'secondname'
		assert_equal 'firstname', user.username
	end


	#
	# password
	#
	test "validate presence of password" do
		user = User.new(:password => nil)
		assert !user.valid?
		assert user.errors.invalid?(:password)
	end


	test "ensure length of password in 5..250" do
		user = User.new
		user.password = 'x' * 4
		user.password_confirmation = 'x' * 4
		user.valid?
		assert user.errors.invalid?(:password)

		user.password = 'x' * 5
		user.password_confirmation = 'x' * 5
		user.valid?
		assert !user.errors.invalid?(:password)

		user.password = 'x' * 250
		user.password_confirmation = 'x' * 250
		user.valid?
		assert !user.errors.invalid?(:password)

		user.password = 'x' * 251
		user.valid?
		assert user.errors.invalid?(:password)
	end


	test "validate that password and confirmation must match" do
		password = 'password'
		user = User.new(:password_confirmation => password)

		user.password = password
		user.valid?
		assert !user.errors.invalid?(:password)

		user.password = 'wrongpassword'
		user.valid?
		assert user.errors.invalid?(:password)
	end


	#
	# correct_password?
	#
	test "validate the working of correct_password?" do
		password = 'password'
		user = User.new(:password => password, :password_confirmation => password)

		assert user.correct_password?(password)
		assert !user.correct_password?('wrongpassword')
	end


	#
	# User.sign_in
	#
	test "validate the working of User.sign_in" do
		password = 'password'
		user = Factory.user!(:password => password, :password_confirmation => password)

		assert_not_nil User.sign_in(user.username, password)
		assert_nil User.sign_in(user.username, 'wrongpassword')
	end

end
