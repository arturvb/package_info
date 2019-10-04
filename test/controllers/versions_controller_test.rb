require 'test_helper'

class VersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @version = versions(:one)
  end

  test "should get index" do
    get versions_url, as: :json
    assert_response :success
  end

  test "should create version" do
    assert_difference('Version.count') do
      post versions_url, params: { version: { name: @version.name, package_id: @version.package_id } }, as: :json
    end

    assert_response 201
  end

  test "should show version" do
    get version_url(@version), as: :json
    assert_response :success
  end

  test "should update version" do
    patch version_url(@version), params: { version: { name: @version.name, package_id: @version.package_id } }, as: :json
    assert_response 200
  end

  test "should destroy version" do
    assert_difference('Version.count', -1) do
      delete version_url(@version), as: :json
    end

    assert_response 204
  end
end
