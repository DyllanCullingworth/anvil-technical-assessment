# frozen_string_literal: true

class MatchController < ApplicationController
  include MemberRankConcern

  def calculate_rank
    member1 = Member.find(match_params[:member1])
    member2 = Member.find(match_params[:member2])
    result = match_params[:result]

    if member1.current_rank < member2.current_rank
      higher_ranked = member1
      lower_ranked = member2
    else
      higher_ranked = member2
      lower_ranked = member1
    end

    rank_difference = (member1.current_rank - member2.current_rank).abs

    if result == 'draw'
      redirect_to root_path, notice: 'No change draw' and return if rank_difference <= 1

      rank_change(lower_ranked, 1)
    end

    if result == 'member1_wins'
      redirect_to root_path, notice: 'No change mem 1' and return if higher_ranked == member1

      rank_change_down(higher_ranked)
      rank_change_up(lower_ranked, (rank_difference / 2).round)
    end

    if result == 'member2_wins'
      redirect_to root_path, notice: 'No change mem 2' and return if higher_ranked == member2

      rank_change_down(higher_ranked)
      rank_change_up(lower_ranked, (rank_difference / 2).round)
    end

    flash[:notice] = "Match successfully added"
    redirect_to root_path
  end

  private

  # Only allow a list of trusted parameters through.
  def match_params
    params.require(:match).permit(:member1, :member2, :result)
  end
end
