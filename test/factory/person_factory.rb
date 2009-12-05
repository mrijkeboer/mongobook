module PersonFactory

	def PersonFactory.append_features(client)

		def client.person_attributes
			{
				:name => 'Test Person',
				:sort_key => 'person test',
				:search_key => 'testperson'
			}
		end


		def client.person(params = {})
			return Person.new(Factory.person_attributes.merge(params))
		end


		def client.person!(params = {})
			obj = Factory.person(params)
			obj.save!
			obj
		end

	end

end
