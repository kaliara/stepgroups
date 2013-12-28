class Meeting < ActiveRecord::Base
  belongs_to :meeting_address
  accepts_nested_attributes_for :meeting_address
  
  def day
    Date::DAYNAMES[wday] + "s"
  end
  
  def time
    Time.new(2000, 1, 1, hour, minute).strftime("%l:%M%p")
  end
  
  def next_meeting_date
    today = Date.today
    cwday = wday == 0 ? 7 : wday
    next_cweek = (today.cweek == 52 ? 0 : today.cweek) + 1 
    today.cwday > cwday ? DateTime.commercial((today + 7).year, next_cweek, cwday, hour, minute) : DateTime.commercial(today.year, today.cweek, cwday, hour, minute)
  end
  
  def self.upcoming(limit = 3)
    Meeting.all.sort { |a,b| a.next_meeting_date <=> b.next_meeting_date }[0..(limit - 1)]
  end
end
