require "test_helper"

class LibraryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get library_index_url
    assert_response :success
  end

  test "should get add_book" do
    get library_add_book_url
    assert_response :success
  end

  test "should get list_books" do
    get library_list_books_url
    assert_response :success
  end

  test "should get delete_book" do
    get library_delete_book_url
    assert_response :success
  end

  test "should get edit_book" do
    get library_edit_book_url
    assert_response :success
  end
end
