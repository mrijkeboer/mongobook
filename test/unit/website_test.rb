require File.dirname(__FILE__) + "/../test_helper"

class WebsiteTest < ActiveSupport::TestCase

	#
	# url
	#
	test "ensure length of url within 1..250" do
		website = Website.new

		website.url = nil
		website.valid?
		assert website.errors.invalid?(:url)

		website.url = ''
		website.valid?
		assert website.errors.invalid?(:url)

		website.url = 'x'
		website.valid?
		assert !website.errors.invalid?(:url)

		website.url = 'x' * 250
		website.valid?
		assert !website.errors.invalid?(:url)

		website.url = 'x' * 251
		website.valid?
		assert website.errors.invalid?(:url)
	end

end
