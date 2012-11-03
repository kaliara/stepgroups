class AntispamValidator < ActiveModel::Validator
  def validate(record)
    unless record.antispam_value.to_i == (Date.today.day / 10 + 1) + (Date.today.wday + 1)
      record.errors[:base] << "Please correctly answer the captcha question"
    end
  end
end