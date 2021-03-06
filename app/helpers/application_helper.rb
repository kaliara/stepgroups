module ApplicationHelper
  
  # content
  def render_content(name)
    raw Content.find_by_name(name).try(:value)
  end
  
  def content_exists?(name)
    !Content.find_by_name(name).try(:value).blank?
  end
  
  
  # antispam logic
  def antispam_arg1
    return %W[zero one two three four five six seven eight nine][Message.count.to_s[-1].to_i]
  end
  
  def antispam_arg2
    Message.count.odd? ? 2 : 3
  end
  
  
  # formatters
  def nice_boolean(exp)
    exp == false ? "No" : "Yes"
  end
  
  def nice_notes(str)
    str.gsub(/\-\s+|\,\s+|\.\s+|\;/,"<br/>").html_safe
  end
  
  def nice_date(date)
    date.strftime("%b %e, %Y")
  end

  def nice_datetime(date)
    date.strftime("%b %e, %Y at %l:%M%P")
  end
  
  def nice_phone(num)
    number_to_phone num.gsub(/\-|\(|\)|\s/,""), :area_code => true, :delimiter => "-"
  end
  
  def nice_money(amount)
    number_to_currency amount, :precision => 10, :significant => true, :strip_insignificant_zeros => true, :unit => ""
  end
  
  def nice_seconds(seconds)
    if seconds > 59
      return (seconds / 60).to_s + "min " + (seconds % 60).to_s + " sec"
    else
      seconds.to_s + " sec" 
    end
  end
end
