class bing_link < SimpleDelegator

  def initialize(item, quantity)
    super(link)
    @quantity = quantity
  end

end
