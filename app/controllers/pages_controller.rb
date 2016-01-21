class PagesController < ApplicationController
  def index
  end
  def new
  end
  def score
  end

  before_action :require_login, only: [:new]

end
