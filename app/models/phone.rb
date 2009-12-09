class Phone
	include MongoMapper::EmbeddedDocument

	belongs_to :contact

	key :number, String
	key :type, String

	validates_length_of :number, :within => 1..250
	validates_length_of :type, :within => 1..250

end
