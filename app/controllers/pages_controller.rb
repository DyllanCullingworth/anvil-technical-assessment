class PagesController < ApplicationController
  def home
    @members = Member.all.order(current_rank: :asc)
    @leaderboard = @members.limit(10)
    @match = Match.new
  end
end