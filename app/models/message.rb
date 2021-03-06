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

# == Schema Information
# Schema version: 20090206190209
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  subject    :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
  
  belongs_to :sender, :class_name => 'User', :foreign_key =>'sender_id'
  belongs_to :recipient, :class_name => 'User', :foreign_key =>'recipient_id'
  
end


