require File.dirname(__FILE__) + '/factory/address_factory'
require File.dirname(__FILE__) + '/factory/contact_factory'
require File.dirname(__FILE__) + '/factory/user_factory'

module Factory

	include AddressFactory
	include ContactFactory
	include UserFactory

end
