class Covid19CDC::Scraper

  @@all = []
  @@search_array = []

    def self.all
        @@all
    end

    def self.search_array
        @@search_array
    end

    def self.mass_create_from_api(newsarr)
        newsarr.each do |newshash|
            new(newshash[:state],
              newshash[:url],
              newshash[:cases_reported],
              newshash[:tranmission],
              )
        end
        # binding.pry
    end

    attr_accessor :state, :url, :cases_reported, :tranmission

    def initialize(state, url, cases_reported, tranmission)
        @state = state
        @url = url
        @cases_reported = cases_reported
        @tranmission = tranmission
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
