# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  def index
    @members = Member.all
  end

  def show; end

  def new
    @member = Member.new
  end

  def edit; end

  def create
    @member = Member.new(member_params)
    @member.current_rank = Member.count + 1

    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:name, :surname, :email, :birthday, :games_played, :current_rank)
  end
end