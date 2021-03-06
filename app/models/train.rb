class Train < ActiveRecord::Base

  def train_name
    "#{train_no} - #{name}"
  end

  def self.train_name(code)
    station = get_record(code)
    "#{station.try(:train_name)}"
  end

  def self.get_trains
    if last.nil?
      transaction do
        path = Rails.root.to_s + "/trains.csv"
        CSV.read(path, headers:true).each do |train|
          Train.create!(train.to_hash)
        end
      end
    end
    all
  end

  def self.get_name(no)
    get_record(no).try(:name)
  end

  def self.get_record(no)
    find_by_train_no no
  end

end
