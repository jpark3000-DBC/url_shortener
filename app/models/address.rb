require 'securerandom'
# require 'URI'

class Address < ActiveRecord::Base
  belongs_to :user

  validates :long, uniqueness: true, presence: true, format: { with: URI::regexp(%w(http https)) }

  def self.create_url(long_url, id)
    short = SecureRandom.hex(2)
    Address.create(long: long_url, short: short, user_id: id)
  end

  def self.get_short(short)
    url = Address.where(short: short)[0]
    url.count += 1
    url.save
    url.long
  end
end
