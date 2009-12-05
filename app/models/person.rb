class Person
	include MongoMapper::Document

	many :addresses
	many :contact_methods

	key :name, String
	key :sort_key, String
	key :search_key, String

	validates_presence_of :name
	validates_length_of :name, :within => 1..250
	validates_uniqueness_of :name
	validates_length_of :sort_key, :within => 0..250, :allow_nil => true
	validates_length_of :search_key, :within => 0..250, :allow_nil => true

	timestamps!

	def before_save
		self[:search_key] = self.name.to_s.delete(" ").downcase

		if self.sort_key.to_s.length == 0
			self.sort_key = self.name.to_s.delete(" ")
		end
	end


	def sort_key=(val)
		self[:sort_key] = val.to_s.downcase
	end


	def address
		if addresses.length > 0
			return addresses[0].address
		else
			return ''
		end
	end


	def zipcode
		if addresses.length > 0
			return addresses[0].zipcode
		else
			return ''
		end
	end


	def city
		if addresses.length > 0
			return addresses[0].city
		else
			return ''
		end
	end


	def country
		if addresses.length > 0
			return addresses[0].country
		else
			return ''
		end
	end


	def phone
		if contact_methods.length > 0
			for method in contact_methods
				if method.name.to_s.downcase == 'phone'
					return method.value
				end
			end

			for method in contact_methods
				if method.name.to_s.downcase == 'mobile'
					return method.value
				end
			end
			return ''
		else
			return ''
		end
	end

end
