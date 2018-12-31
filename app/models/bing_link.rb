class BingLink < SimpleDelegator
  attr_reader  :title,
               :bing_site_link_text,
               :question

  def initialize(link_data, question)
    @title = link_data[:name]
    @bing_site_link_text = link_data[:url]
    @question = question
  end

end
