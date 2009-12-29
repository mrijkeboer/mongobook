class InstantMessaging
	include MongoMapper::EmbeddedDocument

	TYPES = [ 'MSN', 'AIM', 'ICQ', 'Jabber', 'IRC', 'Yahoo', 'Hyves', 'Other' ]

	key :account, String
	key :type, String

	validates_length_of :account, :within => 1..250
	validates_length_of :type, :within => 1..6

	def contact
		return self._root_document
	end

end
