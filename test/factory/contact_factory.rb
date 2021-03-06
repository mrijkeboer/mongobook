module ContactFactory

	def ContactFactory.append_features(client)

		def client.contact_attributes
			{
				:name => 'Test Contact'
			}
		end


		def client.contact(params = {})
			return Contact.new(Factory.contact_attributes.merge(params))
		end


		def client.contact!(params = {})
			obj = Factory.contact(params)
			obj.save!
			obj
		end

	end

end
