class PagesController < ApplicationController
  before_action :check_login , only: [:show]

  def index
  end

  def show

  end
end
