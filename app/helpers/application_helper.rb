module ApplicationHelper
  
  def render_content(name)
    raw Content.find_by_name(name).try(:value)
  end
  
  def content_exists?(name)
    !Content.find_by_name(name).try(:value).blank?
  end
  
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
end
