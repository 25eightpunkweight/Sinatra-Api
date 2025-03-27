class ClientService

  # Assumption: given the clients.json, 
  # I am assuming that the clients data 
  # at this point has been converted into 
  # a ruby hash before being passed to the following methods.

  # Criteria 1:
  # Search through all clients and return those with 
  # names/emails partially matching a given search query
  def self.search_by_key(collection, key, term)
    # also adapted this to allow whatever key you want to search for.
    key = key.to_sym
    return nil unless collection.first.keys.include?(key)
    return collection.select{ |x| x[key].include?(term) }
  end

  # Criteria 2:
  # Find out if there are any clients with the same email in the dataset, 
  # and show those duplicates if any are found.
  def self.find_dups(collection, key)
    key = key.to_sym
    return nil unless collection.first.keys.include?(key)
    array = collection.map{|x| x[key]}
    map = {}
    dup = []
    array.each do |v|
      map[v] = (map[v] || 0 ) + 1
    end
  
    return map.select{|k,v| v > 1}
  end
end