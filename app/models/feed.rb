class Feed < ApplicationRecord
  belongs_to :device
  extend Enumerize

  enumerize :sex, in: [:male, :female]
end
