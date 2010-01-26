module WebsiteFactory

	def WebsiteFactory.append_features(client)

		def client.website_attributes
			{
				:url => 'www.example.com'
			}
		end


		def client.website(params = {})
			website = Website.new(Factory.website_attributes.merge(params))
			contact = Factory.contact
			contact.websites << website
			website
		end


		def client.website!(params = {})
			obj = Factory.website(params)
			obj.save
			obj
		end

	end

end
