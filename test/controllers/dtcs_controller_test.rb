require "test_helper"

class DtcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dtc = dtcs(:one)
  end

  test "should get index" do
    get dtcs_url
    assert_response :success
  end

  test "should get new" do
    get new_dtc_url
    assert_response :success
  end

  test "should create dtc" do
    assert_difference("Dtc.count") do
      post dtcs_url, params: { dtc: {  } }
    end

    assert_redirected_to dtc_url(Dtc.last)
  end

  test "should show dtc" do
    get dtc_url(@dtc)
    assert_response :success
  end

  test "should get edit" do
    get edit_dtc_url(@dtc)
    assert_response :success
  end

  test "should update dtc" do
    patch dtc_url(@dtc), params: { dtc: {  } }
    assert_redirected_to dtc_url(@dtc)
  end

  test "should destroy dtc" do
    assert_difference("Dtc.count", -1) do
      delete dtc_url(@dtc)
    end

    assert_redirected_to dtcs_url
  end
end
