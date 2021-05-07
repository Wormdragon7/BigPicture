require "application_system_test_case"

class ScenesTest < ApplicationSystemTestCase
  setup do
    @scene = scenes(:one)
  end

  test "visiting the index" do
    visit scenes_url
    assert_selector "h1", text: "Scenes"
  end

  test "creating a Scene" do
    visit scenes_url
    click_on "New Scene"

    fill_in "Description", with: @scene.description
    fill_in "Image", with: @scene.image
    fill_in "Number", with: @scene.number
    fill_in "Scenario", with: @scene.scenario_id
    fill_in "Title", with: @scene.title
    fill_in "When", with: @scene.when
    click_on "Create Scene"

    assert_text "Scene was successfully created"
    click_on "Back"
  end

  test "updating a Scene" do
    visit scenes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @scene.description
    fill_in "Image", with: @scene.image
    fill_in "Number", with: @scene.number
    fill_in "Scenario", with: @scene.scenario_id
    fill_in "Title", with: @scene.title
    fill_in "When", with: @scene.when
    click_on "Update Scene"

    assert_text "Scene was successfully updated"
    click_on "Back"
  end

  test "destroying a Scene" do
    visit scenes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scene was successfully destroyed"
  end
end
