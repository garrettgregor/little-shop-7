require "rails_helper"

RSpec.describe InvoiceItem, type: :model do 
  let!(:merchant_1) { create(:merchant) }
  let!(:items_m1) { create_list(:item, 5, merchant_id: merchant_1.id) }

  let!(:customer_7) { create(:customer) }
  static_time_1 = Time.zone.parse('2023-04-13 00:50:37')
  let!(:invoice_7) { create(:invoice, customer_id: customer_7.id, created_at: static_time_1) }
  
  let!(:invoice_item_1) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[0].id, status: 1, unit_price: 3700 ) }

  describe "relationships" do 
    it { should belong_to(:item) }
    it { should belong_to(:invoice) }
  end

  describe "instance methods" do
    it "#cents_to_dollar" do
      expect(invoice_item_1.cents_to_dollar).to eq(37)
    end
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
      expect(invoice_item_1.format_unit_price).to eq("90.0")
      expect(invoice_item_2.format_unit_price).to eq("5.0")
    end

  end
end
