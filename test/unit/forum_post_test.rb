# == Schema Information
#
# Table name: forum_posts
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  title          :string(255)
#  body           :text
#  parent_id      :integer(4)
#  forum_topic_id :integer(4)
#  featured       :boolean(1)
#  created_at     :datetime
#  updated_at     :datetime
#  views          :integer(4)      default(0)
#

require 'test_helper'

class ForumPostTest < ActiveSupport::TestCase


  def test_log_activity_after_create
    post = ForumPost.create({
                             :user_id => 1,
                             :title => 'Test Forum Post',
                             :body => 'This is the body of my forum post',
                             :parent_id => nil,
                             :forum_topic_id => '1',
                             :featured => false       
                           })
    assert post, 'Failed to create attendance' 
    act = Activity.find_by_item_id_and_item_type(post.id, 'ForumPost')
    assert act, 'Failed to log activity' 
    assert act.user_id == post.user_id, 'Incorrecty user id'
    assert act.public == true, 'Should be public'
    assert act.item_id == post.id, 'Incorrect item id'
    assert act.item_type == 'ForumPost', 'Incorrect item_type'
    assert act.action == nil, 'Incorrect action' 
  end


  def test_short_form
    post = ForumPost.create({
                             :user_id => 1,
                             :title => 'Test Forum Post',
                             :body => 'This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post,
                                       This is the body of my forum post',
                             :parent_id => nil,
                             :forum_topic_id => '1',
                             :featured => false       
                           })
    short = post.short_form
    assert short.length == 40, 'Unexpected short form length' 
    assert post.body[0..39] == short, 'Unexpected short form value' 
  end
  

end
