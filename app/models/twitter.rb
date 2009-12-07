class Twitter
	include MongoMapper::EmbeddedDocument

	belongs_to :person

	key :username, String

	validates_length_of :username, :within => 1..250

end
