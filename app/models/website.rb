class Website
	include MongoMapper::EmbeddedDocument

	key :url, String

	validates_length_of :url, :within => 1..250

	def contact
		return self._root_document
	end

end
