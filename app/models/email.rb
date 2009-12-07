class Email
	include MongoMapper::EmbeddedDocument

	belongs_to :person

	key :address, String

	validates_length_of :address, :within => 1..250

end
