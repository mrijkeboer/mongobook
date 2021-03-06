class Email
	include MongoMapper::EmbeddedDocument

	key :address, String

	validates_length_of :address, :within => 1..250

	def contact
		return self._root_document
	end

end
