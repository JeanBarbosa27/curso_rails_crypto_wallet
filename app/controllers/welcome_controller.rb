class WelcomeController < ApplicationController
  def index
    @teacher = 'Jackson Pires'  
    @course = params[:curso] || 'Ruby on Rails 5.2 - do início ao fim'
  end
end
