class Setting < RailsSettings::Base

  def self.update_list(list)
    list.each do |var, value|
      Setting[var] = value
    end
  end

end
