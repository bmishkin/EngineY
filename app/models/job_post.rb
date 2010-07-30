# == Schema Information
# Schema version: 20100730194913
#
# Table name: job_posts
#
#  id           :integer(4)      not null, primary key
#  job_title    :string(255)
#  job_id       :string(255)
#  company      :string(255)
#  website      :string(255)
#  contact_name :string(255)
#  email        :string(255)
#  description  :text
#  featured     :boolean(1)
#  end_date     :date
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

class JobPost < ActiveRecord::Base
  
  include Streamable 
  acts_as_streamable
  
  def user
    nil
  end
  
  acts_as_taggable_on :tags
  
end
