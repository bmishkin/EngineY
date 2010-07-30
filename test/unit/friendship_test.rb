# == Schema Information
#
# Table name: friendships
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  friend_id  :integer(4)
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  
  
  def test_exists
    assert Friendship.exists?(users(:sam), users(:quentin))
  end
  
  
  def test_accept
    fr1 = Friendship.get_friendship(users(:quentin), users(:sam))
    assert_not_nil fr1
    assert fr1.status == 'pending'
    fr1.accept
    friendship = Friendship.get_friendship(users(:quentin), users(:sam))
    assert friendship.status == 'accepted'
  end
  
  
  def test_breakup
    fr1 = Friendship.get_friendship(users(:quentin), users(:sam))
    assert_not_nil fr1
    assert fr1.status == 'pending'
    fr1.accept
    friendship = Friendship.get_friendship(users(:sam), users(:quentin))
    assert friendship.status == 'accepted'
    friendship.breakup
    assert_nil Friendship.get_friendship(users(:quentin), users(:sam))
  end
end
