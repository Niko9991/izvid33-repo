require "test_helper"

class PapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paper = papers(:one)
  end

  test "should get index" do
    get supplier_papers_url
    assert_response :success
  end

  test "should get new" do
    get new_supplier_paper_url
    assert_response :success
  end

  test "should create paper" do
    assert_difference("Paper.count") do
      post supplier_papers_url, params: { paper: { article: @paper.article, certificate: @paper.certificate, comment: @paper.comment, group: @paper.group, labtest: @paper.labtest, location_certificate: @paper.location_certificate, location_labtest: @paper.location_labtest, supplier_id: @paper.supplier_id, year: @paper.year } }
    end

    assert_redirected_to supplier_paper_url(Paper.last)
  end

  test "should show paper" do
    get supplier_paper_url(@paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_supplier_paper_url(@supplier, @paper)
    assert_response :success
  end

  test "should update paper" do
    patch supplier_paper_url(@supplier, @paper), params: { paper: { article: @paper.article, certificate: @paper.certificate, comment: @paper.comment, group: @paper.group, labtest: @paper.labtest, location_certificate: @paper.location_certificate, location_labtest: @paper.location_labtest, supplier_id: @paper.supplier_id, year: @paper.year } }
    assert_redirected_to paper_url(@paper)
  end

 test "should destroy paper" do
  assert_difference("Paper.count", -1) do
    delete supplier_paper_url(@paper.supplier, @paper)
  end

  assert_redirected_to supplier_papers_url(@paper.supplier)
end
end
