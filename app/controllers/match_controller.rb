# frozen_string_literal: true

class MatchController < ApplicationController
  include MemberRankConcern

  def calculate_rank
    member1 = Member.find(match_params[:member1])
    member2 = Member.find(match_params[:member2])

    if member1 == member2
      flash[:notice] = 'Players cannot play against themselves'
      redirect_to root_path and return
    end

    member1.update(games_played: member1.games_played += 1)
    member2.update(games_played: member2.games_played += 1)

    result = match_params[:result]

    if member1.current_rank < member2.current_rank
      higher_ranked = member1
      lower_ranked = member2
    else
      higher_ranked = member2
      lower_ranked = member1
    end

    rank_difference = (member1.current_rank - member2.current_rank).abs

    if result == 'draw' && rank_difference <= 1 ||
       result == 'member1_wins' && higher_ranked == member1 ||
       result == 'member2_wins' && higher_ranked == member2

      flash[:notice] = 'No change to ranks'
      redirect_to root_path and return
    end

    if result == 'draw'
      rank_change_up(lower_ranked, 1)
    else
      rank_change_down(higher_ranked)
      rank_change_up(lower_ranked, (rank_difference / 2).round)
    end

    flash[:notice] = 'Match successfully added'
    redirect_to root_path
  end

  private

  # Only allow a list of trusted parameters through.
  def match_params
    params.require(:match).permit(:member1, :member2, :result)
  end
end