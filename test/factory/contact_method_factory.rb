module ContactMethodFactory

	def ContactMethodFactory.append_features(client)

		def client.contact_method_attributes
			{
				:person_id => Factory.person!.id,
				:name => 'Email',
				:value => 'test@example.com'
			}
		end


		def client.contact_method(params = {})
			return ContactMethod.new(Factory.contact_method_attributes.merge(params))
		end


		def client.contact_method!(params = {})
			obj = Factory.contact_method(params)
			obj.save!
			obj
		end

	end

end
