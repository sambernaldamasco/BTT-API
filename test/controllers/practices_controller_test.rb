require 'test_helper'

class PracticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @practice = practices(:one)
  end

  test "should get index" do
    get practices_url, as: :json
    assert_response :success
  end

  test "should create practice" do
    assert_difference('Practice.count') do
      post practices_url, params: { practice: { date: @practice.date, has_happened: @practice.has_happened, league_id: @practice.league_id, location: @practice.location } }, as: :json
    end

    assert_response 201
  end

  test "should show practice" do
    get practice_url(@practice), as: :json
    assert_response :success
  end

  test "should update practice" do
    patch practice_url(@practice), params: { practice: { date: @practice.date, has_happened: @practice.has_happened, league_id: @practice.league_id, location: @practice.location } }, as: :json
    assert_response 200
  end

  test "should destroy practice" do
    assert_difference('Practice.count', -1) do
      delete practice_url(@practice), as: :json
    end

    assert_response 204
  end
end
