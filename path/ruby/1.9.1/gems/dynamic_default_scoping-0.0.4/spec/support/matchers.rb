RSpec::Matchers.define :have_valid_locale do |*args|
  locales = Array.wrap(args[0] || I18n.locale).map &:to_s

  match do |*records|
    records.flatten.all? { |record| locales.include? record.locale }
  end
end
