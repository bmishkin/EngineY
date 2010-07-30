# == Schema Information
#
# Table name: activities
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  public     :boolean(1)      default(TRUE)
#  item_id    :integer(4)
#  item_type  :string(255)
#  action     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def test_global_feed
    result = Activity.global_feed
    # global feed size limit is 10
    assert result.size == 10, 'Incorrect activities length'
    assert result[0].item_type == 'BlogPost', 'Incorrect item type'
    assert result[0].item_id == 1, 'Incorrrect item id' 
    assert result[1].item_type == 'BlogPost', 'Incorrect item type'
    assert result[1].item_id == 2, 'Incorrrect item id' 
  end
  
  
  def test_activity_stream
    result = Activity.activity_stream
    assert result.size == 0, 'Incorrect activity stream length'
  end
  
end
