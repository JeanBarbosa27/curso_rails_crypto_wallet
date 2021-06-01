class Coin < ApplicationRecord
  belongs_to :mining_type, class_name: 'MiningType', foreign_key: 'mining_type_id'
end
