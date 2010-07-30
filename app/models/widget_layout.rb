# == Schema Information
# Schema version: 20100730194913
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

class WidgetLayout < ActiveRecord::Base
  
  belongs_to :page
  belongs_to :widget
  belongs_to :html_content
  
  attr_accessor :widget_name
  
end
