require "rails_helper"

RSpec.describe "ApplicationRecord", type: :model do
  let!(:merchant_1) { create(:merchant) }

  let!(:items_m1) { create_list(:item, 5, merchant_id: merchant_1.id) }

  let!(:customer_7) { create(:customer) }

  static_time_1 = Time.zone.parse('2023-04-13 00:50:37')
  static_time_2 = Time.zone.parse('2023-03-13 00:50:37')
  static_time_3 = Time.zone.parse('2023-02-13 00:50:37')

  let!(:invoice_7) { create(:invoice, customer_id: customer_7.id, created_at: static_time_1) }
  let!(:invoice_8) { create(:invoice, customer_id: customer_7.id) }
  let!(:invoice_9) { create(:invoice, customer_id: customer_7.id, created_at: static_time_2) }
  let!(:invoice_10) { create(:invoice, customer_id: customer_7.id, created_at: static_time_3) }

  let!(:invoice_item_1) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[0].id, status: 1 ) }
  let!(:invoice_item_2) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[1].id, status: 1 ) }
  let!(:invoice_item_3) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[2].id, status: 0 ) }
  let!(:invoice_item_4) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[3].id, status: 0 ) }
  let!(:invoice_item_5) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 2 ) }
  let!(:invoice_item_8) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 0 ) }

  describe 'Application Record inherited instance methods' do
    it '#format_time_stamp' do
      expect(invoice_7.format_time_stamp).to eq("Thursday, April 13, 2023")
    end
  end
end