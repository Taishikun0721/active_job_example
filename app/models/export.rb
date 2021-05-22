
require 'csv'

class Export
  def initialize
  end

  def to_users_csv
    CSV.generate(headers: User.attribute_names, write_headers: true) do |csv|
      User.all.each do |user|
        csv << User.attribute_names.map { |attribute| user.send(attribute) }
      end
    end
  end
end