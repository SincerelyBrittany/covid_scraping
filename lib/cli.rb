class Covid19CDC::CLI

  def start
    puts "I am here"
    # Covid19CDC::APIManager.get_info
    #Covid19CDC::APIManager.search_by_county
    Covid19CDC::APIManager.search_by_state
  end

end
