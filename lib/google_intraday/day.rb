require 'csv'

module GoogleIntraday
 class Day < Struct.new(:ticks, :exchange, :headers, :date)

    def to_csv
      ticks.unshift(headers)
    end

    def to_hash
      string_data = ticks.map {|row| row.map {|cell| cell.to_s } }
      array_of_hashes = string_data.map {|row| Hash[*headers.zip(row).flatten] }
    end

    def self.build(data)
      csv = CSV.parse(data)

      day = self.new
      day.exchange = CGI.unescape(csv.first.first)

      day.headers = strip_extra(csv[4])
      csv.shift(7)

      day.ticks = adjust_time(csv)
      day.date = Time.at(Integer(day.ticks.first.first))
      day
    end

    def self.strip_extra(array)
      array.unshift(array.shift.split('=').last)
    end

    def self.adjust_time(csv)
      current_time_base = 0
      csv.map do |point|
        if point.first.include? 'a'
          current_time_base = point[0] = point[0].gsub!(/[a]/, '')
        end
        if point.first.length <= 5
          point.unshift("#{current_time_base[0..-(point.first.length +1)]}#{point.shift}")
        end
        point
      end
    end

  end
end
