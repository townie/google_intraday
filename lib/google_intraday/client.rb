require 'csv'

module GoogleIntraday
 class Client
    def self.fetch_6s_ticks(stock_symbol = nil)
      period = 10
      day = 1
      stock_symbol ||= "APNX"
      url ="http://www.google.com/finance/getprices?i=#{period}&p=#{day}d&f=d,o,h,l,c,v&df=cpct&q=#{stock_symbol}"
      data = HTTParty.get(url)

    end
  end
end
