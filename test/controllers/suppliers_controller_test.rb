require "test_helper"

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supplier = suppliers(:one)
    @user = users(:one)
    @locale = :en

    # Log in the user via your session#create route
    post session_path(locale: @locale), params: { email: @user.email_address, password: "password" }
  end

  test "should get index" do
    get suppliers_path(locale: @locale)
    assert_response :success
  end

  test "should get new" do
    get new_supplier_path(locale: @locale)
    assert_response :success
  end

  test "should create supplier" do
    assert_difference("Supplier.count") do
      post suppliers_path(locale: @locale), params: {
        supplier: {
          description: @supplier.description,
          email: @supplier.email,
          name: @supplier.name,
          user_id: @user.id
        }
      }
    end

    assert_redirected_to supplier_path(Supplier.last, locale: @locale)
  end

  test "should show supplier" do
    get supplier_path(@supplier, locale: @locale)
    assert_response :success
  end

  test "should get edit" do
    get edit_supplier_path(@supplier, locale: @locale)
    assert_response :success
  end

  test "should update supplier" do
    patch supplier_path(@supplier, locale: @locale), params: {
      supplier: {
        description: @supplier.description,
        email: @supplier.email,
        name: "Updated Name",
        user_id: @user.id
      }
    }
    assert_redirected_to supplier_path(@supplier, locale: @locale)
  end

  test "should destroy supplier" do
    assert_difference("Supplier.count", -1) do
      delete supplier_path(@supplier, locale: @locale)
    end

    assert_redirected_to suppliers_path(locale: @locale)
  end
end
