class Covid19CDC::APIManager

    BASE_URL = 'https://data.cdc.gov/'


    def self.get_info
      url = 'https://www.cdc.gov/coronavirus/2019-ncov/cases-updates/cases-in-us.html'
      doc = Nokogiri::HTML.parse(open(url))
      total_cases = doc.css("span.count")[0].text
      total_deaths = doc.css("span.count")[1].text
      new_cases = doc.css("span.new-cases")[0].text
      new_deaths = doc.css("span.new-cases")[1].text

    end

    def self.search_by_county
      url = BASE_URL + 'resource/kn79-hsxy.json?county_name=Etowah County'
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      res = response.body
      binding.pry
    end

    def self.county_by_state
     url = BASE_URL + 'resource/kn79-hsxy.json?state_name=NY'
     uri = URI.parse(url)
     response = Net::HTTP.get_response(uri)
     res = response.body
     binding.pry
    end

    def self.search_by_state
     url = "https://covidtracking.com/api/states"
     uri = URI.parse(url)
     response = Net::HTTP.get_response(uri)
     res = response.body
     binding.pry
    end


end
