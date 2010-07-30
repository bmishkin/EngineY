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

#   Copyright 2009 Timothy Fisher
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

class BookReview < ActiveRecord::Base
  
  include Streamable 
  acts_as_streamable
  
  acts_as_taggable_on :tags
  
  belongs_to :user

  
end


