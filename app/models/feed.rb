# == Schema Information
#
# Table name: feeds
#
#  id                :bigint(8)        not null, primary key
#  grouping_field    :string
#  grouping_interval :integer
#  grouping_type     :string
#  metric_field      :string
#  metric_type       :string
#  name              :string
#  order             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  device_id         :bigint(8)
#
# Indexes
#
#  index_feeds_on_device_id  (device_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_id => devices.id)
#

class Feed < ApplicationRecord
  belongs_to :device
  extend Enumerize

  enumerize :sex, in: [:male, :female]
end
