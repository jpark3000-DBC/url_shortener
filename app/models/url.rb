require 'securerandom'
require 'URI'

class Url < ActiveRecord::Base
  before_save do |url|
    url.short = SecureRandom.hex(2)
  end

  validates :long, uniqueness: true, presence: true, format: { with: URI::regexp(%w(http https)) }

  def self.create_url(long_url)
    Url.create(long: long_url)
  end

  def self.get_short(short)
    url = Url.where(short: short)
    url[0].count += 1
    url[0].save
    url[0].long
  end
end
