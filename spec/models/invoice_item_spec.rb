require "rails_helper"

RSpec.describe InvoiceItem, type: :model do 
  describe "relationships" do 
    it { should belong_to(:item) }
    it { should belong_to(:invoice) }
  end

  describe 'instance methods' do
    let!(:merchant) { create(:merchant) }

    let!(:item_1) { create(:item, merchant_id: merchant.id) }
    let!(:item_2) { create(:item, merchant_id: merchant.id) }

    let!(:customer_1) { create(:customer) } 

    let!(:invoice_1) { create(:invoice, customer_id: customer_1.id) }
    let!(:invoice_2) { create(:invoice, customer_id: customer_1.id) }

    let!(:invoice_item_1) { create(:invoice_item, item_id: item_1.id, invoice_id: invoice_1.id, status: 2, unit_price: 9000) }
    let!(:invoice_item_2) { create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, status: 1, unit_price: 500) }
    
    it '#format_unit_price' do
      expect(invoice_item_1.format_unit_price).to eq("400.01")
      expect(invoice_item_7.format_unit_price).to eq("123.45")
    end

  end
end