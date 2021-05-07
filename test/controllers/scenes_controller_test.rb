require "test_helper"

class ScenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:one)
  end

  test "should get index" do
    get scenes_url
    assert_response :success
  end

  test "should get new" do
    get new_scene_url
    assert_response :success
  end

  test "should create scene" do
    assert_difference('Scene.count') do
      post scenes_url, params: { scene: { description: @scene.description, image: @scene.image, number: @scene.number, scenario_id: @scene.scenario_id, title: @scene.title, when: @scene.when } }
    end

    assert_redirected_to scene_url(Scene.last)
  end

  test "should show scene" do
    get scene_url(@scene)
    assert_response :success
  end

  test "should get edit" do
    get edit_scene_url(@scene)
    assert_response :success
  end

  test "should update scene" do
    patch scene_url(@scene), params: { scene: { description: @scene.description, image: @scene.image, number: @scene.number, scenario_id: @scene.scenario_id, title: @scene.title, when: @scene.when } }
    assert_redirected_to scene_url(@scene)
  end

  test "should destroy scene" do
    assert_difference('Scene.count', -1) do
      delete scene_url(@scene)
    end

    assert_redirected_to scenes_url
  end
end
