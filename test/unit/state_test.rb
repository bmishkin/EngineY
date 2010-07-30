# == Schema Information
#
# Table name: states
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  country_id   :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class StateTest < ActiveSupport::TestCase


  def test_get_state_list
    State.init_states
    list = State.list
    assert list.length == 60, 'Incorrect state list length'
  end
  
  
  def test_verify_2_digit_state_codes
    State.init_states
    list = State.list
    list.each do |state|
      assert state[1].size == 2, 'Incorrect state code length' 
    end
  end
  
  
end
