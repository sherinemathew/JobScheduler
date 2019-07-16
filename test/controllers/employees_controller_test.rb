require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get employees_add_url
    assert_response :success
  end

  test "should get delete" do
    get employees_delete_url
    assert_response :success
  end

end
