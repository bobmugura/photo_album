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

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
