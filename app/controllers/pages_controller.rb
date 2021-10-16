class PagesController < ApplicationController
  def home
    @members = Member.all.order(current_rank: :asc)
    @match = Match.new
  end
end