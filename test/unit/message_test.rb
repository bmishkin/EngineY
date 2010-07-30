# == Schema Information
#
# Table name: messages
#
#  id           :integer(4)      not null, primary key
#  subject      :string(255)
#  body         :text
#  sender_id    :integer(4)
#  recipient_id :integer(4)
#  read         :boolean(1)      default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
