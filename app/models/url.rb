require 'securerandom'
require 'URI'

class Url < ActiveRecord::Base

  validates :long, uniqueness: true, presence: true, format: { with: URI::regexp(%w(http https)) }

  def self.create_url(long_url)
    short = SecureRandom.hex(2)
    Url.create(long: long_url, short: short)
  end

  def self.get_short(short)
    url = Url.where(short: short)[0]
    url.count += 1
    url.save
    url.long
  end
end
