module AddressFactory

	def AddressFactory.append_features(client)

		def client.address_attributes
			{
				:address => 'Teststreet 1',
				:zipcode => '1234 AB',
				:city => 'Foobar',
				:country => 'The Netherlands'
			}
		end


		def client.address(params = {})
			address = Address.new(Factory.address_attributes.merge(params))
			contact = Factory.contact
			contact.addresses << address
			address
		end


		def client.address!(params = {})
			obj = Factory.address(params)
			obj.save!
			obj
		end

	end

end
