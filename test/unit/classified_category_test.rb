# == Schema Information
#
# Table name: classified_categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ClassifiedCategoryTest < ActiveSupport::TestCase


  def test_name_validation
    assert classified_categories(:one).valid? == true, 'Expected valid classified category' 
    classified_categories(:one).name = nil
    assert classified_categories(:one).valid? == false, "Expected invalid classified category" 
  end


end
