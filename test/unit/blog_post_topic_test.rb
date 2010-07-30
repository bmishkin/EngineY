# == Schema Information
#
# Table name: blog_post_topics
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  name       :string(255)
#  parent_id  :integer(4)
#  default    :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BlogPostTopicTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
