class InstantMessaging
	include MongoMapper::EmbeddedDocument

	belongs_to :person

	key :account, String
	key :type, String

	validates_length_of :name, :within => 1..250
	validates_length_of :type, :within => 1..250

end
