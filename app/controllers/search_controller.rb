class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @pics = Person.search(params[:q])
    @organizations = Organization.search(params[:q])
  end
end
