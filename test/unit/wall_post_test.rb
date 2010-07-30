# == Schema Information
#
# Table name: wall_posts
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  group_id   :integer(4)
#  event_id   :integer(4)
#  sender_id  :integer(4)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class WallPostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
