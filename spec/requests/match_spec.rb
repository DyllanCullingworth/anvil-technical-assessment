require 'rails_helper'

RSpec.describe "Matches", type: :request do
  describe "POST /calculate_rank" do


    context "Game is a draw and players are adjacent:" do
      it "no change" do
        5.times do |num|
          Member.create(name: "Member #{num}", surname: "Member #{num}", email: "member#{num}@gmail.com", birthday: num.years.ago, games_played: 0, current_rank: Member.count + 1)
        end

        member1 = Member.where(current_rank: 2).first.id
        member2 = Member.where(current_rank: 3).first.id
        result = 'draw'

        post match_path, params: { match: {member1: member1, member2: member2, result: result} }

        expect(Member.find(member1).current_rank).to eq(2)
        expect(Member.find(member2).current_rank).to eq(3)
      end
    end

    describe "Game is a draw and players are not adjacent" do
      it "lower rank moves up 1, higher rank stays the same" do
        5.times do |num|
          Member.create(name: "Member #{num}", surname: "Member #{num}", email: "member#{num}@gmail.com", birthday: num.years.ago, games_played: 0, current_rank: Member.count + 1)
        end

        member1 = Member.where(current_rank: 2).first.id
        member2 = Member.where(current_rank: 4).first.id
        result = 'draw'

        post match_path, params: { match: {member1: member1, member2: member2, result: result} }

        expect(Member.find(member1).current_rank).to eq(2)
        expect(Member.find(member2).current_rank).to eq(3)
      end
    end

    describe "Player is higher rank and wins" do
      it "no change" do
        5.times do |num|
          Member.create(name: "Member #{num}", surname: "Member #{num}", email: "member#{num}@gmail.com", birthday: num.years.ago, games_played: 0, current_rank: Member.count + 1)
        end

        member1 = Member.where(current_rank: 2).first.id
        member2 = Member.where(current_rank: 3).first.id
        result = 'member1_wins'

        post match_path, params: { match: {member1: member1, member2: member2, result: result} }

        expect(Member.find(member1).current_rank).to eq(2)
        expect(Member.find(member2).current_rank).to eq(3)
      end
    end

    describe "Player is lower rank and wins" do
      it "higher rank goes down by 1, lower rank goes up the difference in ranks divided by 2 ( rounded to nearest whole number)" do
        5.times do |num|
          Member.create(name: "Member #{num}", surname: "Member #{num}", email: "member#{num}@gmail.com", birthday: num.years.ago, games_played: 0, current_rank: Member.count + 1)
        end

        member1 = Member.where(current_rank: 1).first.id
        member2 = Member.where(current_rank: 5).first.id
        result = 'member2_wins'

        post match_path, params: { match: {member1: member1, member2: member2, result: result} }

        expect(Member.find(member1).current_rank).to eq(2)
        expect(Member.find(member2).current_rank).to eq(3)
      end
    end
  end
end
