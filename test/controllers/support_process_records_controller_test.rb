require 'test_helper'

class SupportProcessRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support_process_record = support_process_records(:one)
  end

  test "should get index" do
    get support_process_records_url
    assert_response :success
  end

  test "should get new" do
    get new_support_process_record_url
    assert_response :success
  end

  test "should create support_process_record" do
    assert_difference('SupportProcessRecord.count') do
      post support_process_records_url, params: { support_process_record: { contents: @support_process_record.contents, name: @support_process_record.name, title: @support_process_record.title } }
    end

    assert_redirected_to support_process_record_url(SupportProcessRecord.last)
  end

  test "should show support_process_record" do
    get support_process_record_url(@support_process_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_support_process_record_url(@support_process_record)
    assert_response :success
  end

  test "should update support_process_record" do
    patch support_process_record_url(@support_process_record), params: { support_process_record: { contents: @support_process_record.contents, name: @support_process_record.name, title: @support_process_record.title } }
    assert_redirected_to support_process_record_url(@support_process_record)
  end

  test "should destroy support_process_record" do
    assert_difference('SupportProcessRecord.count', -1) do
      delete support_process_record_url(@support_process_record)
    end

    assert_redirected_to support_process_records_url
  end
end
