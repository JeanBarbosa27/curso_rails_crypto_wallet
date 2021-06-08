class WelcomeController < ApplicationController
  def index
    @teacher = 'Jackson Pires'
    @course = params[:curso] || 'Ruby on Rails 5.2 - do início ao fim'
    @coins = Coin.all
    @mining_types = MiningType.all
  end
end
