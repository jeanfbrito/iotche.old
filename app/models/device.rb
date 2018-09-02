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

class Device < ApplicationRecord
  has_many :readings
  has_many :feeds
  validates_uniqueness_of(:write_key)
  validates_uniqueness_of(:read_key)

  def generate_write_key
    self.write_key = loop do
      random_key = SecureRandom.base58(16) #16 digits
      break random_key unless Device.exists?(write_key: random_key)
    end
    self.save
  end

  def generate_read_key
    self.read_key = loop do
      random_key = SecureRandom.base58(16) #16 digits
      break random_key unless Device.exists?(read_key: random_key)
    end
    self.save
  end
end
