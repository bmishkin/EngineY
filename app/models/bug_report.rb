# == Schema Information
#
# Table name: bug_reports
#
#  id              :integer(4)      not null, primary key
#  title           :string(255)
#  browser         :string(255)
#  user_id         :integer(4)
#  description     :text
#  module          :string(255)
#  resolved        :boolean(1)      default(FALSE)
#  comment         :text
#  resolution_date :date
#  priority        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
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

class BugReport < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of     :title, :description
  
  
end


