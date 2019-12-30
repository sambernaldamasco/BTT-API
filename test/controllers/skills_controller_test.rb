require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill = skills(:one)
  end

  test "should get index" do
    get skills_url, as: :json
    assert_response :success
  end

  test "should create skill" do
    assert_difference('Skill.count') do
      post skills_url, params: { skill: { awareness_communication: @skill.awareness_communication, backwards_skating: @skill.backwards_skating, hockey_stop: @skill.hockey_stop, lateral_movement: @skill.lateral_movement, mental_recovery: @skill.mental_recovery, pack_work: @skill.pack_work, plow_stop: @skill.plow_stop, power_slide: @skill.power_slide, recovery: @skill.recovery, skater_id: @skill.skater_id, speed_endurance: @skill.speed_endurance, strategy_adaptability: @skill.strategy_adaptability, transitions: @skill.transitions, turning_toe: @skill.turning_toe } }, as: :json
    end

    assert_response 201
  end

  test "should show skill" do
    get skill_url(@skill), as: :json
    assert_response :success
  end

  test "should update skill" do
    patch skill_url(@skill), params: { skill: { awareness_communication: @skill.awareness_communication, backwards_skating: @skill.backwards_skating, hockey_stop: @skill.hockey_stop, lateral_movement: @skill.lateral_movement, mental_recovery: @skill.mental_recovery, pack_work: @skill.pack_work, plow_stop: @skill.plow_stop, power_slide: @skill.power_slide, recovery: @skill.recovery, skater_id: @skill.skater_id, speed_endurance: @skill.speed_endurance, strategy_adaptability: @skill.strategy_adaptability, transitions: @skill.transitions, turning_toe: @skill.turning_toe } }, as: :json
    assert_response 200
  end

  test "should destroy skill" do
    assert_difference('Skill.count', -1) do
      delete skill_url(@skill), as: :json
    end

    assert_response 204
  end
end
