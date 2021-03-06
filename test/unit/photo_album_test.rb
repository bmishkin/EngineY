# == Schema Information
#
# Table name: photo_albums
#
#  id          :integer(4)      not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  view_count  :integer(4)
#  title       :string(255)
#  description :text
#  user_id     :integer(4)
#

require 'test_helper'

class PhotoAlbumTest < ActiveSupport::TestCase


  def test_user_id_validation
    assert photo_albums(:one).valid? == true, 'Expected valid photo album' 
    photo_albums(:one).user_id = nil
    assert photo_albums(:one).valid? == false, "Expected invalid photo album" 
    assert(photo_albums(:one).errors.invalid?(:user_id))
  end
  
  
  def test_title_validation
    assert photo_albums(:one).valid? == true, 'Expected valid photo album' 
    photo_albums(:one).title = nil
    assert photo_albums(:one).valid? == false, "Expected invalid photo album" 
    assert(photo_albums(:one).errors.invalid?(:title))
  end
  
  
  def test_get_owner
    album = PhotoAlbum.find(1)
    album.owner.id == album.user.id
  end
  
  
end
