# == Schema Information
# Schema version: 20100730194913
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

class BlogPostTopic < ActiveRecord::Base
  
  belongs_to :user
  has_and_belongs_to_many :blog_posts
  
end
