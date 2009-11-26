include MongoMapper

MongoMapper.database = "addressbook-#{Rails.env}"

# It's also possible to define indexes in the the model itself; however,
# a few issues are being worked out still. This is a temporary solution.
#Comment.ensure_index([["story_id", 1], ["path", 1], ["points", -1]])
#MongoMapper.ensure_indexes!

# Handle passenger forking.
if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.database.connect_to_master if forked
   end
end 
