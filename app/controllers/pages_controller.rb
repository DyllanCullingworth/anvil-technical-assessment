class PagesController < ApplicationController
  def home
    @members = Member.all.order(current_rank: :desc)
    @match = Match.new
  end
end