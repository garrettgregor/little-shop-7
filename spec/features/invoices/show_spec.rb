require 'rails_helper'

RSpec.describe 'Merchant/invoice show page', type: :feature do
  let!(:merchant) { create(:merchant) }
  let!(:merchant_1) { create(:merchant) }

  let!(:item_1) { create(:item, merchant_id: merchant.id) }
  let!(:item_2) { create(:item, merchant_id: merchant.id) }
  let!(:item_3) { create(:item, merchant_id: merchant.id) }
  let!(:item_4) { create(:item, merchant_id: merchant.id) }
  let!(:item_5) { create(:item, merchant_id: merchant.id) }
  let!(:item_6) { create(:item, merchant_id: merchant.id) }
  let!(:item_7) { create(:item, merchant_id: merchant.id) }
  let!(:item_8) { create(:item, merchant_id: merchant.id) }
  let!(:item_9) { create(:item, merchant_id: merchant_1.id) }

  let!(:customer_1) { create(:customer) }
  let!(:customer_2) { create(:customer) }
  let!(:customer_3) { create(:customer) }
  let!(:customer_4) { create(:customer) }
  let!(:customer_5) { create(:customer) }
  let!(:customer_6) { create(:customer) }
  let!(:customer_8) { create(:customer) }

  let!(:invoice_1) { create(:invoice, customer_id: customer_1.id, created_at: "2012-03-25 09:54:09 UTC") }
  let!(:invoice_2) { create(:invoice, customer_id: customer_2.id, created_at: "2012-05-25 09:54:09 UTC") }
  let!(:invoice_3) { create(:invoice, customer_id: customer_3.id, created_at: "2012-07-25 09:54:09 UTC") }
  let!(:invoice_4) { create(:invoice, customer_id: customer_4.id) }
  let!(:invoice_5) { create(:invoice, customer_id: customer_5.id) }
  let!(:invoice_6) { create(:invoice, customer_id: customer_6.id) }
  let!(:invoice_7) { create(:invoice, customer_id: customer_6.id) }

  let!(:invoice_item_1) { create(:invoice_item, item_id: item_1.id, invoice_id: invoice_1.id, status: 0, unit_price: 2000, quantity: 3) }
  let!(:invoice_item_2) { create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, status: 2) }
  let!(:invoice_item_3) { create(:invoice_item, item_id: item_3.id, invoice_id: invoice_3.id, status: 2) }
  let!(:invoice_item_4) { create(:invoice_item, item_id: item_4.id, invoice_id: invoice_4.id, status: 0) }
  let!(:invoice_item_5) { create(:invoice_item, item_id: item_5.id, invoice_id: invoice_5.id, status: 0) }
  let!(:invoice_item_6) { create(:invoice_item, item_id: item_6.id, invoice_id: invoice_6.id, status: 2, unit_price: 1500, quantity: 12) }
  let!(:invoice_item_7) { create(:invoice_item, item_id: item_9.id, invoice_id: invoice_7.id, status: 1) }
  let!(:invoice_item_8) { create(:invoice_item, item_id: item_9.id, invoice_id: invoice_6.id, status: 1, unit_price: 9000, quantity: 10) }

  describe 'Invoice attrbutes' do
    it 'should display the invoice id, status, and created_at date' do
      visit "/merchants/#{merchant.id}/invoices/#{invoice_1.id}"
      
      expect(page).to have_content(invoice_1.id)
      expect(page).to have_content(invoice_1.status)
      expect(page).to have_content(invoice_1.format_time_stamp)
      
      visit "/merchants/#{merchant.id}/invoices/#{invoice_2.id}"
      
      expect(page).to have_content(invoice_2.id)
      expect(page).to have_content(invoice_2.status)
      expect(page).to have_content(invoice_2.format_time_stamp)
    end

    it 'displays customers full name on each invoice' do
      visit "/merchants/#{merchant.id}/invoices/#{invoice_2.id}"
      
      expect(page).to have_content(invoice_2.customer_full_name)
    end

    it 'displays total revenue on invoice' do
      visit "/merchants/#{merchant.id}/invoices/#{invoice_1.id}"
      
      expect(page).to have_content("Total Revenue: $60.0")
      
      visit "/merchants/#{merchant.id}/invoices/#{invoice_6.id}"
      
      expect(page).to have_content("Total Revenue: $1080.0")
    end
  end

  describe 'Invoice Items Attributes' do
    it "displays items' name, quantity, unit price" do
      visit "/merchants/#{merchant.id}/invoices/#{invoice_1.id}"
      
      expect(page).to have_content(invoice_item_1.item.name)
      expect(page).to have_content(invoice_item_1.status)
      expect(page).to have_content(invoice_item_1.quantity)
      expect(page).to have_content(invoice_item_1.format_unit_price)
  
      
      visit "/merchants/#{merchant.id}/invoices/#{invoice_6.id}"
      
      expect(page).to have_content(invoice_item_6.item.name)
      expect(page).to have_content(invoice_item_6.status)
      expect(page).to have_content(invoice_item_6.quantity)
      expect(page).to have_content(invoice_item_6.format_unit_price)
      expect(page).to have_content(invoice_item_8.status)
      expect(page).to have_content(invoice_item_8.quantity)
      expect(page).to have_content(invoice_item_8.format_unit_price)
    end
  end
  describe 'Dropdown menu to change status options' do
    it 'displays the dropdown menu with status options' do
      visit "/merchants/#{merchant.id}/invoices/#{invoice_1.id}"
      
      within("#invoice_items") do
        expect(page).to have_select(selected: 'pending')
        expect(page).to have_button('Update Item Status')
        
        select("shipped", from: "Status")
        click_button('Update Item Status')
        expect(current_path).to eq("/merchants/#{merchant.id}/invoices/#{invoice_1.id}")
      end

      visit "/merchants/#{merchant.id}/invoices/#{invoice_6.id}"
      
      within("#items-#{invoice_item_6.item_id}") do
        expect(page).to have_select(selected: 'shipped')
        expect(page).to have_button('Update Item Status')
  
        select("packaged", from: "Status")
        click_button('Update Item Status')
        expect(current_path).to eq("/merchants/#{merchant.id}/invoices/#{invoice_6.id}")
      end
      
      visit "/merchants/#{merchant.id}/invoices/#{invoice_6.id}"
      
      within("#items-#{invoice_item_8.item_id}") do
        expect(page).to have_select(selected: 'packaged')
        expect(page).to have_button('Update Item Status')
  
        select("pending", from: "Status")
        click_button('Update Item Status')
        expect(current_path).to eq("/merchants/#{merchant.id}/invoices/#{invoice_6.id}")
      end
      
      visit "/merchants/#{merchant.id}/invoices/#{invoice_6.id}"
      
      expect(page).to have_select(selected: 'packaged')
      expect(page).to have_select(selected: 'pending')
      expect(page).to_not have_select(selected: 'shipped')
      
      visit "/merchants/#{merchant.id}/invoices/#{invoice_1.id}"
      
      expect(page).to_not have_select(selected: 'packaged')
      expect(page).to_not have_select(selected: 'pending')
      expect(page).to have_select(selected: 'shipped')
    end
  end
end
