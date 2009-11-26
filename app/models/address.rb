class Address
	include MongoMapper::EmbeddedDocument

	key :address, String
	key :zipcode, String
	key :city, String
	key :country, String

end
