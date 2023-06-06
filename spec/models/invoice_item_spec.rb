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
end
