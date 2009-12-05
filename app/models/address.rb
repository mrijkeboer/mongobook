class Address
	include MongoMapper::EmbeddedDocument

	belongs_to :person

	key :address, String
	key :zipcode, String
	key :city, String
	key :country, String

	validates_length_of :address, :within => 0..250, :allow_nil => true
	validates_length_of :zipcode, :within => 0..250, :allow_nil => true
	validates_length_of :city, :within => 0..250, :allow_nil => true
	validates_length_of :country, :within => 0..250, :allow_nil => true

end
