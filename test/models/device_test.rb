# == Schema Information
#
# Table name: devices
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  read_key   :string
#  uid        :string
#  write_key  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
