class BingLink < SimpleDelegator
  attr_reader  :title,
               :bing_site_link_text,
               :question,
               :bing_display_text

  def initialize(link_data, question)
    @title = link_data[:name]
    @bing_site_link_text = link_data[:url]
    @bing_display_text = link_data[:displayUrl]
    @question = question
  end

end
