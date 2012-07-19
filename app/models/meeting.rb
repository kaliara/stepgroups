class Meeting < ActiveRecord::Base
  belongs_to :meeting_address
  accepts_nested_attributes_for :meeting_address
  
  def day
    Date::DAYNAMES[wday] + "s"
  end
  
  def time
    Time.new(2000, 1, 1, hour, minute).strftime("%l:%M%p")
  end
end
