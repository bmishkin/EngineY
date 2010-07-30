# == Schema Information
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  created_at                :datetime
#  updated_at                :datetime
#  login                     :string(255)
#  email                     :string(255)
#  email_hash                :string(255)
#  first_name                :string(255)
#  last_name                 :string(255)
#  sex                       :string(255)
#  city                      :string(255)
#  state_id                  :integer(4)
#  zip                       :string(255)
#  country_id                :integer(4)
#  phone                     :string(255)
#  phone2                    :string(255)
#  time_zone                 :string(255)     default("UTC")
#  about_me                  :text
#  organization              :string(255)
#  skills                    :text
#  occupation                :text
#  featured                  :boolean(1)      default(FALSE)
#  show_blog_posts_on_home   :boolean(1)      default(TRUE)
#  use_gravatar              :boolean(1)      default(FALSE)
#  website                   :string(255)
#  blog                      :string(255)
#  blog_feed                 :string(255)
#  flickr                    :string(255)
#  flickr_username           :string(255)
#  linked_in_url             :string(255)
#  twitter_id                :string(255)
#  display_tweets            :boolean(1)      default(FALSE)
#  aim_name                  :string(255)
#  gtalk_name                :string(255)
#  yahoo_messenger_name      :string(255)
#  msn_name                  :string(255)
#  youtube_username          :string(255)
#  skype_name                :string(255)
#  facebook_url              :string(255)
#  facebook_id               :integer(4)
#  resume_url                :string(255)
#  company_url               :string(255)
#  posts_count               :integer(4)      default(0)
#  last_seen_at              :datetime
#  login_count               :integer(4)      default(0)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  remember_token            :string(255)
#  remember_token_expires_at :datetime
#  activation_code           :string(40)
#  activated_at              :datetime
#  password_reset_code       :string(40)
#  enabled                   :boolean(1)      default(TRUE)
#  is_active                 :boolean(1)      default(FALSE)
#  identity_url              :string(255)
#  receive_emails            :boolean(1)      default(TRUE)
#  api_key                   :string(40)      default("")
#

require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  fixtures :users


  def test_get_admins_and_creators
    admins = User.admins_and_creators
    assert admins.size == 2, 'Incorrect number of admins and creators'
    assert admins[0].id == 1
    assert admins[1].id == 6
  end
  
  
  def test_get_current_status
    status = users(:quentin).current_status
    assert status.body == 'Status Post 1', 'Incorrect status'
    
    status = users(:sam).current_status
    assert status == nil, 'Incorrect status'
  end
  
  
  def test_get_status_activity_stream
    activities = users(:quentin).status_activity_stream
    assert activities.length == 3, 'Incorrect number of activities'
    assert activities[0].id == 3, 'Incorrect activity'
    assert activities[1].id == 4, 'Incorrect activity'
  end
  
  
  def test_get_friends_activity_stream
    activities = users(:quentin).friends_activity_stream
    assert activities.length == 22, 'Incorrect number of activities'
    assert activities[0].id == 1, 'Incorrect activity'
    assert activities[1].id == 2, 'Incorrect activity'
    assert activities[2].id == 3, 'Incorrect activity'
    assert activities[3].id == 4, 'Incorrect activity'
    assert activities[4].id == 8, 'Incorrect activity'
    assert activities[5].id == 9, 'Incorrect activity'
    assert activities[6].id == 10, 'Incorrect activity'
  end
  
  
  def test_get_friends_status_activity_stream
    acts = users(:quentin).friends_status_activity_stream
    assert acts.length == 4, 'Incorrect number of activities'
    assert acts[0].id == 3, 'Incorrect activity'
    assert acts[1].id == 4, 'Incorrect activity'
    assert acts[2].id == 9, 'Incorrect activity'
  end
  
  
  def test_get_friends_ids
    ids = users(:quentin).get_friends_ids
    assert ids.length == 3, 'Incorrect number of friends'
    assert ids[0] == 8, 'Incorrect user id'
    assert ids[1] == 5, 'Incorrect user id'
    assert ids[2] == 1, 'Incorrect user id'
  end
  

  def test_get_name
    assert users(:quentin).name == 'quentin test' 
  end
  
  
  def test_get_gender
    assert users(:quentin).gender == 'Male'
    assert users(:bobby).gender == 'Female'
  end
  
  
  def test_get_non_active_users
    users = User.non_active_users
    assert users.length == 2, 'Incorrect number of users'
  end
  
  
  def test_should_create_user
    assert_difference 'User.count' do
      user = create_user
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end
  

  def test_should_initialize_activation_code_upon_creation
    user = create_user
    user.reload
    assert_not_nil user.activation_code
  end
  

  def test_should_require_login
    assert_no_difference 'User.count' do
      u = create_user(:login => nil)
      assert u.errors.on(:login)
    end
  end


  def test_should_require_password
    assert_no_difference 'User.count' do
      u = create_user(:password => nil)
      assert u.errors.on(:password)
    end
  end


  def test_should_require_password_confirmation
    assert_no_difference 'User.count' do
      u = create_user(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end
  

  def test_should_require_email
    assert_no_difference 'User.count' do
      u = create_user(:email => nil)
      assert u.errors.on(:email)
    end
  end
  

  def test_should_reset_password
    users(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal users(:quentin), User.authenticate('quentin', 'new password')
  end
  

  def test_should_not_rehash_password
    users(:quentin).update_attributes(:login => 'quentin2')
    assert_equal users(:quentin), User.authenticate('quentin2', 'test')
  end
  

  def test_should_authenticate_user
    assert_equal users(:quentin), User.authenticate('quentin', 'test')
  end
  

  def test_should_set_remember_token
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
  end


  def test_should_unset_remember_token
    users(:quentin).remember_me
    assert_not_nil users(:quentin).remember_token
    users(:quentin).forget_me
    assert_nil users(:quentin).remember_token
  end


  def test_should_remember_me_for_one_week
    before = 1.week.from_now.utc
    users(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
  end


  def test_should_remember_me_until_one_week
    time = 1.week.from_now.utc
    users(:quentin).remember_me_until time
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert_equal users(:quentin).remember_token_expires_at, time
  end


  def test_should_remember_me_default_two_weeks
    before = 2.weeks.from_now.utc
    users(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil users(:quentin).remember_token
    assert_not_nil users(:quentin).remember_token_expires_at
    assert users(:quentin).remember_token_expires_at.between?(before, after)
  end


protected
  def create_user(options = {})
    record = User.new({ :login => 'quire', 
                        :email => 'quire@example.com',
                        :first_name => 'test',
                        :last_name => 'user',
                        :about_me => 'this is about me',
                        :password => 'quire', 
                        :password_confirmation => 'quire' }.merge(options))
    record.save
    record
  end

  
end
