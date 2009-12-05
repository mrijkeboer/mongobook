module UserFactory

	def UserFactory.append_features(client)

		def client.user_attributes
			{ 
				:username => 'user',
				:password => 'password',
				:password_confirmation => 'password'
			}
		end


		def client.user(params = {})
			return User.new(Factory.user_attributes.merge(params))
		end


		def client.user!(params = {})
			obj = Factory.user(params)
			obj.save!
			obj
		end

	end

end
