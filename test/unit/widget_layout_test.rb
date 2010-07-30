# == Schema Information
#
# Table name: widget_layouts
#
#  id              :integer(4)      not null, primary key
#  page_id         :integer(4)
#  widget_id       :integer(4)
#  col_num         :integer(4)
#  row_num         :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  html_content_id :integer(4)
#

require 'test_helper'

class WidgetLayoutTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
