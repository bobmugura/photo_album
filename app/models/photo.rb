# == Schema Information
#
# Table name: photos
#
#  id            :integer          not null, primary key
#  album_id      :integer
#  title         :string
#  url           :string
#  thumbnail_url :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Photo < ActiveRecord::Base
  belongs_to :album

  validates :album_id, presence: true
  validates :title, presence: true
  validates :thumbnail_url, presence: true
end
