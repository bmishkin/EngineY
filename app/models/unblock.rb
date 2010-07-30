# == Schema Information
# Schema version: 20100730194913
#
# Table name: unblocks
#
#  id       :integer(4)      not null, primary key
#  user_id  :integer(4)      not null
#  weekdate :date            not null
#  dayflags :integer(2)      default(0), not null
#




class Unblock < ActiveRecord::Base

  belongs_to :user
  
  validates_presence_of :user_id
  validates_presence_of :weekdate
  
  def validate
    weekdate_must_be_sunday
  end
    
  # by our convention, the weekdate must be a sunday that starts a week. 
  def weekdate_must_be_sunday
    errors.add(:weekdate, 'must be a sunday') unless self.weekdate.wday == 0 # 0 is sunday
  end

  # don't keep rows where everything is blocked
  after_save :destroy_if_zero 
  def destroy_if_dayflags_is_zero
    # self.destroy if dayflags == 0
  end
  
  # == BOOLEAN FLAGS (in column 'flags')
  include FlagShihTzu
  has_flags 1 => :sunday,
            2 => :monday, 
            3 => :tuesday,
            4 => :wednesday,
            5 => :thursday,
            6 => :friday,
            7 => :saturday,
            8 => :sat_eve,
            :colum => :dayflags

  named_scope :unblocked_on, lambda {|date, evening| {:conditions => Unblock.get_condition_for_date(date, evening)} } 

  public
  def Unblock.unblock_for_user(user, date, evening=false)
    ub = Unblock.find_or_create_by_user_id_and_date(user.id, date)
    ub.unblock(date, evening)  
    ub.save
  end
  
  def Unblock.block_for_user(user, date, evening=false)
    ub = Unblock.find_or_create_by_user_id_and_date(user.id, date)
    ub.block(date, evening)
    ub.save
  end
  
  private
  def Unblock.dow_assign_func(date)
    dow = date.strftime('%A')
    "dow#{=}"
  end
  
  def Unblock.dow_condition_func(date)
    dow = date.strftime('%A')
    "dow#{_condition}"
  end
  
  
  def unblock_date(date, evening=false)
    return self.sat_eve = true if evening
    self.send Unblock_dow_assign_func(date), true
  end  

  def block_date(date, evening=false)
    return self.sat_eve = false if evening
    self.send Unblock_dow_assign_func(date), false
  end

  def Unblock.get_condition_for_date(date, evening=false)
    return Player.sat_eve_condition if evening
    return Unblock.send dow_condition_func
  end
  
  
  


end
