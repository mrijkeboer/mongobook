class ContactMethod
	include MongoMapper::EmbeddedDocument

	belongs_to :person

	key :name, String
	key :value, String

	validates_length_of :name, :within => 1..250
	validates_length_of :value, :within => 1..250

end
