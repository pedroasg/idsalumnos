class Tutorial < ActiveRecord::Base
  has_reputation :votes, source: :user, aggregated_by: :sum
end
