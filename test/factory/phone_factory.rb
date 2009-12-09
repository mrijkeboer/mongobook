module PhoneFactory

	def PhoneFactory.append_features(client)

		def client.phone_attributes
			{
				:contact_id => Factory.contact!.id,
				:number => '0123-456789',
				:type => 'Mobile'
			}
		end


		def client.phone(params = {})
			return Phone.new(Factory.phone_attributes.merge(params))
		end


		def client.phone!(params = {})
			obj = Factory.phone(params)
			obj.save!
			obj
		end

	end

end
