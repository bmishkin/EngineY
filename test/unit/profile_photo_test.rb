# == Schema Information
#
# Table name: photos
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  group_id       :integer(4)
#  event_id       :integer(4)
#  title          :string(255)
#  description    :text
#  location       :string(255)
#  parent_id      :integer(4)
#  content_type   :string(255)
#  filename       :string(255)
#  thumbnail      :string(255)
#  size           :integer(4)
#  width          :integer(4)
#  height         :integer(4)
#  is_profile     :boolean(1)
#  created_at     :datetime
#  updated_at     :datetime
#  views          :integer(4)      default(0)
#  view_count     :integer(4)
#  photo_album_id :integer(4)
#

require 'test_helper'

class ProfilePhotoTest < ActiveSupport::TestCase


  def test_create_profile_photo
    photo = ProfilePhoto.new({:filename => 'test.jpg'})
    photo.uploaded_data = fixture_file_upload(photo.filename, 'image/jpeg')     
    photo.save!
    resizes = Photo.find_all_by_parent_id(photo.id)
    assert resizes.length == 4
    
    resizes.each do |photo|
      assert ['thumb','small','medium','member'].member?(photo.thumbnail)
    end
  end
  
  
end
