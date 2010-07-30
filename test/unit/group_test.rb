# == Schema Information
#
# Table name: groups
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  description   :text
#  photo_id      :integer(4)
#  creator_id    :integer(4)
#  featured      :boolean(1)
#  announcements :text
#  private       :boolean(1)      default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase


  def test_log_activity_after_create
    group = Group.create({
                          :name => 'Test Group',
                          :description => 'A group used for testing.',
                          :photo_id => 1,
                          :creator_id => 3,
                          :featured => false,
                          :private => false            
                           })
    assert group, 'Failed to create group' 
    act = Activity.find_by_item_id_and_item_type(group.id, 'Group')
    assert act, 'Failed to log activity' 
    assert act.user_id == group.creator_id, 'Incorrecty user id'
    assert act.public == true, 'Should be public'
    assert act.item_id == group.id, 'Incorrect item id'
    assert act.item_type == 'Group', 'Incorrect item_type'
    assert act.action == nil, 'Incorrect action' 
  end


end
