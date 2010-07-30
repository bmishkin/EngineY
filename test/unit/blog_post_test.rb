# == Schema Information
#
# Table name: blog_posts
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)
#  title        :string(255)
#  body         :text
#  parent_id    :integer(4)
#  published    :boolean(1)
#  featured     :boolean(1)
#  summary      :text
#  url          :string(255)
#  published_at :datetime
#  guid         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  views        :integer(4)      default(0)
#

require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase


  def test_should_not_log_activity_unpublished
    post = create_post_unpublished
    assert post, 'Failed to create blog post' 
    act = Activity.find_by_item_id_and_item_type(post.id, 'BlogPost')
    assert act == nil, 'Should have not logged activity' 
  end
  
  
  def test_should_log_activity_after_create_published
    post = create_post_published
    assert post, 'Failed to create blog post' 
    act = Activity.find_by_item_id_and_item_type(post.id, 'BlogPost')
    assert act, 'Failed to log activity' 
    assert act.user_id == post.user_id, 'Incorrect user id'
    assert act.public == true, 'Should be public'
    assert act.item_id == post.id, 'Incorrect item id'
    assert act.item_type == 'BlogPost', 'Incorrect item_type'
    assert act.action == nil, 'Incorrect action' 
  end
  
  
  def test_should_publish_post
    post = create_post_unpublished
    post_id = post.id
    assert post.published == false, 'Expected false for published attribute'
    post.publish
    post = BlogPost.find(post_id)
    assert post.published == true, 'Exepected true for published attribute'
  end
  
  
  def test_short_form
    post = create_post_published
    short = post.short_form
    assert short.length == 40, 'Unexpected short form length' 
    assert post.body[0..39] == short, 'Unexpected short form value' 
  end
  
  
  private
  
  def create_post_unpublished
    BlogPost.create( {
              :user_id => 1,
              :title => 'Test Blog Post',
              :body => 
              'Body of a test blog post 2Body of a test blog post 
              3Body of a test blog post 4Body of a test blog post
              5Body of a test blog post 6Body of a test blog post
              7Body of a test blog post 8Body of a test blog post
              9Body of a test blog post 0Body of a test blog post
              1Body of a test blog post 2Body of a test blog post
              3Body of a test blog post 4Body of a test blog post
              5Body of a test blog post 6Body of a test blog post
              7Body of a test blog post 8Body of a test blog post
              9Body of a test blog post 0Body of a test blog post',
              :parent_id => nil,
              :published => false,
              :featured => false,
              :summary => 'Summary of the post'
    })
  end
  
  
  def create_post_published
    BlogPost.create( {
              :user_id => 1,
              :title => 'Test Blog Post',
              :body => 
              'Body of a test blog post 2Body of a test blog post 
              3Body of a test blog post 4Body of a test blog post
              5Body of a test blog post 6Body of a test blog post
              7Body of a test blog post 8Body of a test blog post
              9Body of a test blog post 0Body of a test blog post
              1Body of a test blog post 2Body of a test blog post
              3Body of a test blog post 4Body of a test blog post
              5Body of a test blog post 6Body of a test blog post
              7Body of a test blog post 8Body of a test blog post
              9Body of a test blog post 0Body of a test blog post',
              :parent_id => nil,
              :published => true,
              :featured => false,
              :summary => 'Summary of the post'
    })
  end
  
end
