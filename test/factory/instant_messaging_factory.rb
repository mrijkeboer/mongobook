module InstantMessagingFactory

	def InstantMessagingFactory.append_features(client)

		def client.instant_messaging_attributes
			{
				:account => 'test@hotmail.com',
				:type => 'MSN'
			}
		end


		def client.instant_messaging(params = {})
			im = InstantMessaging.new(Factory.instant_messaging_attributes.merge(params))
			contact = Factory.contact
			contact.instant_messagings << im
			im
		end


		def client.instant_messaging!(params = {})
			obj = Factory.instant_messaging(params)
			obj.save
			obj
		end

	end

end
