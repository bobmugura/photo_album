# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  validates :user_id, presence: true
  validates :title, presence: true
end
