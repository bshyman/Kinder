class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  ActiveRecord::Base.time_zone_aware_types = [:datetime]
end
