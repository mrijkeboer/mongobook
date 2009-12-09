module AddressFactory

	def AddressFactory.append_features(client)

		def client.address_attributes
			{
				:contact_id => Factory.contact!.id,
				:address => 'Teststreet 1',
				:zipcode => '1234 AB',
				:city => 'Foobar',
				:country => 'The Netherlands'
			}
		end


		def client.address(params = {})
			return Address.new(Factory.address_attributes.merge(params))
		end


		def client.address!(params = {})
			obj = Factory.address(params)
			obj.save!
			obj
		end

	end

end
