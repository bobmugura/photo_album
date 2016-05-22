class User < ActiveRecord::Base
  has_many :albums
  has_one :address

  accepts_nested_attributes_for :address
end
