module EmailFactory

	def EmailFactory.append_features(client)

		def client.email_attributes
			{
				:contact_id => Factory.contact!.id,
				:address => 'test@example.com'
			}
		end


		def client.email(params = {})
			return Email.new(Factory.email_attributes.merge(params))
		end


		def client.email!(params = {})
			obj = Factory.email(params)
			obj.save!
			obj
		end

	end

end
