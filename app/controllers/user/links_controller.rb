class User::LinksController < ApplicationController

  def new
    @link = Link.new
    respond_to do |format|
      format.html
      format.js
    end
  end

end
