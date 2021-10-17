class PagesController < ApplicationController
  def home
    @members = Member.all.order(current_rank: :asc).limit(10)
    @match = Match.new
  end
end