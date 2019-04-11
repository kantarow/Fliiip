require 'test_helper'

class VocabularyCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vocabulary_cards_new_url
    assert_response :success
  end

  test "should get edit" do
    get vocabulary_cards_edit_url
    assert_response :success
  end

  test "should get show" do
    get vocabulary_cards_show_url
    assert_response :success
  end

  test "should get index" do
    get vocabulary_cards_index_url
    assert_response :success
  end

  test "should get destroy" do
    get vocabulary_cards_destroy_url
    assert_response :success
  end

end
