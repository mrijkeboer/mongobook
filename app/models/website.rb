class Website
	include MongoMapper::EmbeddedDocument

	belongs_to :contact

	key :url, String

	validates_length_of :url, :within => 1..250

end
