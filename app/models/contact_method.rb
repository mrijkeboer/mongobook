class ContactMethod
	include MongoMapper::EmbeddedDocument

	key :name, String
	key :value, String

end
