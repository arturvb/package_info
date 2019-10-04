require 'test_helper'

class VulnerabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vulnerability = vulnerabilities(:one)
  end

  test "should get index" do
    get vulnerabilities_url, as: :json
    assert_response :success
  end

  test "should create vulnerability" do
    assert_difference('Vulnerability.count') do
      post vulnerabilities_url, params: { vulnerability: { description: @vulnerability.description, package_id: @vulnerability.package_id } }, as: :json
    end

    assert_response 201
  end

  test "should show vulnerability" do
    get vulnerability_url(@vulnerability), as: :json
    assert_response :success
  end

  test "should update vulnerability" do
    patch vulnerability_url(@vulnerability), params: { vulnerability: { description: @vulnerability.description, package_id: @vulnerability.package_id } }, as: :json
    assert_response 200
  end

  test "should destroy vulnerability" do
    assert_difference('Vulnerability.count', -1) do
      delete vulnerability_url(@vulnerability), as: :json
    end

    assert_response 204
  end
end
