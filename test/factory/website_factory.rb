module WebsiteFactory

	def WebsiteFactory.append_features(client)

		def client.website_attributes
			{
				:contact_id => Factory.contact!.id,
				:url => 'www.example.com'
			}
		end


		def client.website(params = {})
			return Website.new(Factory.website_attributes.merge(params))
		end


		def client.website!(params = {})
			obj = Factory.website(params)
			obj.save!
			obj
		end

	end

end
