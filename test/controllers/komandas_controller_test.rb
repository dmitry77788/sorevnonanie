require 'test_helper'

class KomandasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @komanda = komandas(:one)
  end

  test "should get index" do
    get komandas_url
    assert_response :success
  end

  test "should get new" do
    get new_komanda_url
    assert_response :success
  end

  test "should create komanda" do
    assert_difference('Komanda.count') do
      post komandas_url, params: { komanda: { name: @komanda.name } }
    end

    assert_redirected_to komanda_url(Komanda.last)
  end

  test "should show komanda" do
    get komanda_url(@komanda)
    assert_response :success
  end

  test "should get edit" do
    get edit_komanda_url(@komanda)
    assert_response :success
  end

  test "should update komanda" do
    patch komanda_url(@komanda), params: { komanda: { name: @komanda.name } }
    assert_redirected_to komanda_url(@komanda)
  end

  test "should destroy komanda" do
    assert_difference('Komanda.count', -1) do
      delete komanda_url(@komanda)
    end

    assert_redirected_to komandas_url
  end
end
