module InstantMessagingFactory

	def InstantMessagingFactory.append_features(client)

		def client.instant_messaging_attributes
			{
				:contact_id => Factory.contact!.id,
				:account => 'test@hotmail.com',
				:type => 'MSN'
			}
		end


		def client.instant_messaging(params = {})
			return InstantMessaging.new(Factory.instant_messaging_attributes.merge(params))
		end


		def client.instant_messaging!(params = {})
			obj = Factory.instant_messaging(params)
			obj.save!
			obj
		end

	end

end
