class Covid19CDC::Scraper

  @@all = []
  @@search_array = []

    def self.all
        @@all
    end

    def self.search_array
        @@search_array
    end
    #total_cases: total_cases, total_deaths: total_deaths, new_cases: new_cases, new_deaths:new_deaths
    def self.mass_create_from_api(newsarr, second_array)
       second_array.each do |newshash|
            new(newshash[:total_cases],
              newshash[:total_deaths],
              newshash[:new_cases],
              newshash[:new_deaths]
              )
        end
        newsarr.each do |newshash|
            new(newshash[:state],
              newshash[:url],
              newshash[:cases_reported],
              newshash[:tranmission]
              )
        end
        binding.pry
    end

    attr_accessor :state, :url, :cases_reported, :tranmission, :total_cases, :total_deaths, :new_cases, :new_deaths

    def initialize(state, url, cases_reported, tranmission)
        @state = state
        @url = url
        @cases_reported = cases_reported
        @tranmission = tranmission
        @total_cases = total_cases
        @total_deaths = total_deaths
        @new_cases = new_cases
        @new_deaths = new_deaths
        save
        test
    end

    def test
      binding.pry
    end

    def to_s
       self.name
   end

   def name
       @title.capitalize
   end

  def save
      @@all << self
  end

  def save_to_search
      @@search_array << self
  end

  def self.destroy_all
      @@search_array = []
  end

  def more?
       !!@description
  end

 def full_details

        <<-DESC
        TITLE: #{title}
        DESCRIPTION: #{description}
        CONTENT: #{content}
        URL TO ARTICLE : #{url}
       DESC

  end

end
