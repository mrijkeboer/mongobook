module TwitterFactory

	def TwitterFactory.append_features(client)

		def client.twitter_attributes
			{
				:username => 'foobar'
			}
		end


		def client.twitter(params = {})
			twitter = Twitter.new(Factory.twitter_attributes.merge(params))
			contact = Factory.contact
			contact.twitters << twitter
			twitter
		end


		def client.twitter!(params = {})
			obj = Factory.twitter(params)
			obj.save
			obj
		end

	end

end
