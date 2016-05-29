# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  username   :string
#  email      :string
#  phone      :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :albums
  has_one :address

  accepts_nested_attributes_for :address

  validates :name, presence: true
  validates :username, presence: true
end
