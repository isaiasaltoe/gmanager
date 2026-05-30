require "test_helper"

class TeamTest < ActiveSupport::TestCase

  test "team name cant be blank" do
    team = Team.new()

    assert_not team.valid?
  end
  # test "the truth" do
  #   assert true
  # end
