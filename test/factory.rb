require File.dirname(__FILE__) + '/factory/address_factory'
require File.dirname(__FILE__) + '/factory/person_factory'
require File.dirname(__FILE__) + '/factory/user_factory'

module Factory

	include AddressFactory
	include PersonFactory
	include UserFactory

end
