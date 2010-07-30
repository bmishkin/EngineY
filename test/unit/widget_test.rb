# == Schema Information
#
# Table name: widgets
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  title        :string(255)
#  active       :boolean(1)
#  protected    :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#  description  :text
#  profile      :boolean(1)
#  ey_module_id :integer(4)
#

require 'test_helper'

class WidgetTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
