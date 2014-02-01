require 'test_helper'

class MagazineDocumentsControllerTest < ActionController::TestCase
  setup do
    @magazine_document = magazine_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magazine_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create magazine_document" do
    assert_difference('MagazineDocument.count') do
      post :create, magazine_document: { commodity_id: @magazine_document.commodity_id, contamination: @magazine_document.contamination, current_number: @magazine_document.current_number, date: @magazine_document.date, destination: @magazine_document.destination, humidity: @magazine_document.humidity, no: @magazine_document.no, prof_of_delivery: @magazine_document.prof_of_delivery, quanity: @magazine_document.quanity, supplier_id: @magazine_document.supplier_id, symbol_of_evidence: @magazine_document.symbol_of_evidence, type: @magazine_document.type, vehicle_number: @magazine_document.vehicle_number }
    end

    assert_redirected_to magazine_document_path(assigns(:magazine_document))
  end

  test "should show magazine_document" do
    get :show, id: @magazine_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @magazine_document
    assert_response :success
  end

  test "should update magazine_document" do
    patch :update, id: @magazine_document, magazine_document: { commodity_id: @magazine_document.commodity_id, contamination: @magazine_document.contamination, current_number: @magazine_document.current_number, date: @magazine_document.date, destination: @magazine_document.destination, humidity: @magazine_document.humidity, no: @magazine_document.no, prof_of_delivery: @magazine_document.prof_of_delivery, quanity: @magazine_document.quanity, supplier_id: @magazine_document.supplier_id, symbol_of_evidence: @magazine_document.symbol_of_evidence, type: @magazine_document.type, vehicle_number: @magazine_document.vehicle_number }
    assert_redirected_to magazine_document_path(assigns(:magazine_document))
  end

  test "should destroy magazine_document" do
    assert_difference('MagazineDocument.count', -1) do
      delete :destroy, id: @magazine_document
    end

    assert_redirected_to magazine_documents_path
  end
end
