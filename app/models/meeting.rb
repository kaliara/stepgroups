class Meeting < ActiveRecord::Base
  belongs_to :district
  
  def day
    Date::DAYNAMES[wday] + "s"
  end
  
  def time
    Time.new(2000, 1, 1, hour, minute).strftime("%l:%M%p")
  end
  
  def short_address
    return [address_building, address_street1, address_street2].delete_if{|x| x.blank?}.join(", ")
  end
end
