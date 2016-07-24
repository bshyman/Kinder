module KinderHelper
  def filter_by(hash, user_collection)
    p hash
    p "PARRRRRRRRRRRRAAAAAMMMMMMMMMMSSSSSSSSSS"
    p params
    results = []
    hash.each_pair do |k,v|
      user_collection.select do |kinder|
        p kinder
      end
    end
  end
end
