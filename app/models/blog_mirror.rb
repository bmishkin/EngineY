# == Schema Information
# Schema version: 20100730194913
#
# Table name: blog_mirrors
#
#  id         :integer(4)      not null, primary key
#  url        :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
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


=begin
  Supports the ability for a user to mirror an existing external blog onto his profile
  instead of using a built-in blog.
=end
class BlogMirror < ActiveRecord::Base
  
  belongs_to :user
  
end
