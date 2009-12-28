class Twitter
	include MongoMapper::EmbeddedDocument

	key :username, String

	validates_length_of :username, :within => 1..250

	def contact
		return self._root_document
	end

end
