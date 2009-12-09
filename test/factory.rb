require File.dirname(__FILE__) + '/factory/address_factory'
require File.dirname(__FILE__) + '/factory/contact_factory'
require File.dirname(__FILE__) + '/factory/email_factory'
require File.dirname(__FILE__) + '/factory/instant_messaging_factory'
require File.dirname(__FILE__) + '/factory/phone_factory'
require File.dirname(__FILE__) + '/factory/twitter_factory'
require File.dirname(__FILE__) + '/factory/user_factory'
require File.dirname(__FILE__) + '/factory/website_factory'

module Factory

	include AddressFactory
	include ContactFactory
	include EmailFactory
	include InstantMessagingFactory
	include PhoneFactory
	include TwitterFactory
	include UserFactory
	include WebsiteFactory

end
