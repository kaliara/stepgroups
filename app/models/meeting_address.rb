class MeetingAddress < ActiveRecord::Base
  has_many :meetings
  belongs_to :district

  def short_address
    return [building, street1, street2].delete_if{|x| x.blank?}.join(", ")
  end
end
