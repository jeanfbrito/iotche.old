require 'test_helper'

class FeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feed = feeds(:one)
  end

  test "should get index" do
    get feeds_url
    assert_response :success
  end

  test "should get new" do
    get new_feed_url
    assert_response :success
  end

  test "should create feed" do
    assert_difference('Feed.count') do
      post feeds_url, params: { feed: { device_id: @feed.device_id, grouping_field: @feed.grouping_field, grouping_interval: @feed.grouping_interval, grouping_type: @feed.grouping_type, metric_field: @feed.metric_field, metric_type: @feed.metric_type, name: @feed.name, order: @feed.order } }
    end

    assert_redirected_to feed_url(Feed.last)
  end

  test "should show feed" do
    get feed_url(@feed)
    assert_response :success
  end

  test "should get edit" do
    get edit_feed_url(@feed)
    assert_response :success
  end

  test "should update feed" do
    patch feed_url(@feed), params: { feed: { device_id: @feed.device_id, grouping_field: @feed.grouping_field, grouping_interval: @feed.grouping_interval, grouping_type: @feed.grouping_type, metric_field: @feed.metric_field, metric_type: @feed.metric_type, name: @feed.name, order: @feed.order } }
    assert_redirected_to feed_url(@feed)
  end

  test "should destroy feed" do
    assert_difference('Feed.count', -1) do
      delete feed_url(@feed)
    end

    assert_redirected_to feeds_url
  end
end
