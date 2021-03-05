require "application_system_test_case"

class VendorsTest < ApplicationSystemTestCase
  setup do
    @vendor = vendors(:one)
  end

  test "visiting the index" do
    visit vendors_url
    assert_selector "h1", text: "Vendors"
  end

  test "creating a Vendor" do
    visit vendors_url
    click_on "New Vendor"

    fill_in "Date delivered", with: @vendor.date_delivered
    fill_in "Date recieved", with: @vendor.date_recieved
    fill_in "Distributed by", with: @vendor.distributed_by
    fill_in "Name", with: @vendor.name
    fill_in "Po number", with: @vendor.po_number
    fill_in "Purchaser", with: @vendor.purchaser_id
    click_on "Create Vendor"

    assert_text "Vendor was successfully created"
    click_on "Back"
  end

  test "updating a Vendor" do
    visit vendors_url
    click_on "Edit", match: :first

    fill_in "Date delivered", with: @vendor.date_delivered
    fill_in "Date recieved", with: @vendor.date_recieved
    fill_in "Distributed by", with: @vendor.distributed_by
    fill_in "Name", with: @vendor.name
    fill_in "Po number", with: @vendor.po_number
    fill_in "Purchaser", with: @vendor.purchaser_id
    click_on "Update Vendor"

    assert_text "Vendor was successfully updated"
    click_on "Back"
  end

  test "destroying a Vendor" do
    visit vendors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vendor was successfully destroyed"
  end
end
