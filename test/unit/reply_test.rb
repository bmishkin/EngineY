# == Schema Information
#
# Table name: replies
#
#  id         :integer(4)      not null, primary key
#  body       :text
#  user_id    :integer(4)
#  item_id    :integer(4)
#  item_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
