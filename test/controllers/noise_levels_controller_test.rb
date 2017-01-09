require 'test_helper'

class NoiseLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @noise_level = noise_levels(:one)
  end

  test "should get index" do
    get noise_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_noise_level_url
    assert_response :success
  end

  test "should create noise_level" do
    assert_difference('NoiseLevel.count') do
      post noise_levels_url, params: { noise_level: { value: @noise_level.value } }
    end

    assert_redirected_to noise_level_url(NoiseLevel.last)
  end

  test "should show noise_level" do
    get noise_level_url(@noise_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_noise_level_url(@noise_level)
    assert_response :success
  end

  test "should update noise_level" do
    patch noise_level_url(@noise_level), params: { noise_level: { value: @noise_level.value } }
    assert_redirected_to noise_level_url(@noise_level)
  end

  test "should destroy noise_level" do
    assert_difference('NoiseLevel.count', -1) do
      delete noise_level_url(@noise_level)
    end

    assert_redirected_to noise_levels_url
  end
end
