require 'test_helper'

class HeroeSetsControllerTest < ActionController::TestCase
  setup do
    @heroe_set = heroe_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:heroe_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create heroe_set" do
    assert_difference('HeroeSet.count') do
      post :create, heroe_set: { active: @heroe_set.active, cost: @heroe_set.cost, description: @heroe_set.description, heroe_id: @heroe_set.heroe_id, title: @heroe_set.title }
    end

    assert_redirected_to heroe_set_path(assigns(:heroe_set))
  end

  test "should show heroe_set" do
    get :show, id: @heroe_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @heroe_set
    assert_response :success
  end

  test "should update heroe_set" do
    patch :update, id: @heroe_set, heroe_set: { active: @heroe_set.active, cost: @heroe_set.cost, description: @heroe_set.description, heroe_id: @heroe_set.heroe_id, title: @heroe_set.title }
    assert_redirected_to heroe_set_path(assigns(:heroe_set))
  end

  test "should destroy heroe_set" do
    assert_difference('HeroeSet.count', -1) do
      delete :destroy, id: @heroe_set
    end

    assert_redirected_to heroe_sets_path
  end
end
