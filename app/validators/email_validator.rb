class EmailValidator < ActiveModel::EachValidator
  def validate_each(rec, att, val)
    rec.errors.add(att, (options[:message] || "has invalid format")) unless valid_email?(val)
  end

  private

  def valid_email?(value)
    URI::MailTo::EMAIL_REGEXP.match? value
  end
end