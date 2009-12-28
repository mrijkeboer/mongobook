module EmailFactory

	def EmailFactory.append_features(client)

		def client.email_attributes
			{
				:address => 'test@example.com'
			}
		end


		def client.email(params = {})
			email = Email.new(Factory.email_attributes.merge(params))
			contact = Factory.contact
			contact.emails << email
			email
		end


		def client.email!(params = {})
			obj = Factory.email(params)
			obj.save!
			obj
		end

	end

end
