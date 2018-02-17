require 'test_helper'

class SubgeneresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subgenere = subgeneres(:one)
  end

  test "should get index" do
    get subgeneres_url
    assert_response :success
  end

  test "should get new" do
    get new_subgenere_url
    assert_response :success
  end

  test "should create subgenere" do
    assert_difference('Subgenere.count') do
      post subgeneres_url, params: { subgenere: { genere_id: @subgenere.genere_id, name: @subgenere.name } }
    end

    assert_redirected_to subgenere_url(Subgenere.last)
  end

  test "should show subgenere" do
    get subgenere_url(@subgenere)
    assert_response :success
  end

  test "should get edit" do
    get edit_subgenere_url(@subgenere)
    assert_response :success
  end

  test "should update subgenere" do
    patch subgenere_url(@subgenere), params: { subgenere: { genere_id: @subgenere.genere_id, name: @subgenere.name } }
    assert_redirected_to subgenere_url(@subgenere)
  end

  test "should destroy subgenere" do
    assert_difference('Subgenere.count', -1) do
      delete subgenere_url(@subgenere)
    end

    assert_redirected_to subgeneres_url
  end
end
