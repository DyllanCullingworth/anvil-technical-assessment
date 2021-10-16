module MemberRankConcern
  extend ActiveSupport::Concern

  def rank_change_up(member, ranks)
    previous_rank = member.current_rank
    new_rank = previous_rank - ranks

    Member.where(current_rank: new_rank...previous_rank).each do |other_member|
      other_member.update(current_rank: other_member.current_rank += 1)
    end

    member.update(current_rank: new_rank)
  end

  def rank_change_down(member)
    previous_rank = member.current_rank
    new_rank = previous_rank + 1

    # Update member whose spot was just taken
    other_member = Member.where(current_rank: new_rank).first
    other_member.update(current_rank: other_member.current_rank -= 1)

    member.update(current_rank: new_rank)
  end
end