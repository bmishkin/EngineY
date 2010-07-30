# == Schema Information
#
# Table name: book_reviews
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  release_date :string(255)
#  publisher    :string(255)
#  website      :string(255)
#  buy_link     :string(255)
#  review       :text
#  user_id      :integer(4)
#  image_url    :string(255)
#  featured     :boolean(1)      default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class BookReviewTest < ActiveSupport::TestCase


  def test_log_activity_after_create
    review = BookReview.create({:name => 'Test Book Review',
                                :release_date => Time.now,
                                :publisher => "O'Reilly",
                                :website => 'www.coolbook.com',
                                :buy_link => 'www.coolbook.com/buy',
                                :review => 'I thought this was a great and cool book.',
                                :user_id => '1',
                                :image_url => 'www.coolbook.com/image.jpg',
                                :featured => false })
    assert review, 'Failed to create book review' 
    act = Activity.find_by_item_id_and_item_type(review.id, 'BookReview')
    assert act, 'Failed to log activity' 
    assert act.user_id == review.user_id, 'Incorrecty user id'
    assert act.public == true, 'Should be public'
    assert act.item_id == review.id, 'Incorrect item id'
    assert act.item_type == 'BookReview', 'Incorrect item_type'
    assert act.action == nil, 'Incorrect action' 
  end
  
  
end

