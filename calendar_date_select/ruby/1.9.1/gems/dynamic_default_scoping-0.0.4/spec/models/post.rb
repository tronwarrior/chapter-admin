class Post < ActiveRecord::Base
  scope :recent, limit(5)

  include DynamicDefaultScoping

  default_scope :language, lambda { |*args|
    case locale = (args[0].presence || I18n.locale).to_s
    when 'any', 'all'
      where :locale => I18n.available_locales.map(&:to_s)
    else
      where :locale => locale
    end
  }
end
