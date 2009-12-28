class Phone
	include MongoMapper::EmbeddedDocument

	key :number, String
	key :type, String

	validates_length_of :number, :within => 1..250
	validates_length_of :type, :within => 1..250

	def contact
		return self._root_document
	end

end
