class PagesController < ApplicationController
  def index
  end
  def new
  end
  def score
  end
  def leaderboard
  end
 

  before_action :require_login, only: [:new]

end
