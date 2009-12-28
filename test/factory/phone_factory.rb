module PhoneFactory

	def PhoneFactory.append_features(client)

		def client.phone_attributes
			{
				:number => '0123-456789',
				:type => 'Mobile'
			}
		end


		def client.phone(params = {})
			phone = Phone.new(Factory.phone_attributes.merge(params))
			contact = Factory.contact
			contact.phones << phone
			phone
		end


		def client.phone!(params = {})
			obj = Factory.phone(params)
			obj.save!
			obj
		end

	end

end
