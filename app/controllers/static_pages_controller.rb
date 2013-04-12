class StaticPagesController < ApplicationController
  before_filter :signed_in_user, only: [:meet]

  def home
  end

  def about
  end

  def blog
  end

  def contact
  end

  def meet
  end

end
