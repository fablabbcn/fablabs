# Use localized name if it's available

ISO3166::Country.class_eval do
  def name
    translations[I18n.locale.to_s] || names.first
  end
end

# class LocalCountry < Country
#   def name
#     translations[I18n.locale.to_s] || names.first
#   end
# end
