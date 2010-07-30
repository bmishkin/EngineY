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

require 'test_helper'

class BugReportTest < ActiveSupport::TestCase

  def test_title_validation
    assert bug_reports(:one).valid? == true, 'Expected valid bug' 
    assert bug_reports(:invalid_title).valid? == false, "Expected invalid bug" 
    bug_reports(:one).title = nil
    assert bug_reports(:one).valid? == false, "Expected invalid bug" 
  end
  
  
  def test_description_validation
    assert bug_reports(:one).valid? == true, 'Expected valid bug' 
    assert bug_reports(:invalid_desc).valid? == false, "Expected invalid bug" 
    bug_reports(:one).description = nil
    assert bug_reports(:one).valid? == false, "Expected invalid bug" 
  end
  
  
end
