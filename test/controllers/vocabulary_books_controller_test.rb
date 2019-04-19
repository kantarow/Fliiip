require 'test_helper'

class VocabularyBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vocabulary_books_new_url
    assert_response :success
  end

  test "should get edit" do
    get vocabulary_books_edit_url
    assert_response :success
  end

  test "should get show" do
    get vocabulary_books_show_url
    assert_response :success
  end

  test "should get index" do
    get vocabulary_books_index_url
    assert_response :success
  end

  test "should get destroy" do
    get vocabulary_books_destroy_url
    assert_response :success
  end

end
