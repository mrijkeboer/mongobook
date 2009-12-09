module TwitterFactory

	def TwitterFactory.append_features(client)

		def client.twitter_attributes
			{
				:contact_id => Factory.contact!.id,
				:username => 'foobar'
			}
		end


		def client.twitter(params = {})
			return Twitter.new(Factory.twitter_attributes.merge(params))
		end


		def client.twitter!(params = {})
			obj = Factory.twitter(params)
			obj.save!
			obj
		end

	end

end
