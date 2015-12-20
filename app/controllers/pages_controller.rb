class PagesController < ApplicationController
  def index
  end
  def new
  end
  before_action :require_login, only: [:new]
end
