# == Schema Information
#
# Table name: rss_feeds
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  url        :string(255)
#  user_id    :integer(4)
#  is_blog    :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class RssFeedTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
