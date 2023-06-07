def load_test_data
  let!(:merchant_1) { create(:merchant, name: "Amazon") }
  let!(:merchant_2) { create(:merchant, name: "Target") }
  let!(:merchant_3) { create(:merchant, name: "King Soopers") }
  let!(:merchant_4) { create(:merchant, name: "Merchant 4", status: 1) }
  let!(:merchant_5) { create(:merchant, name: "Merchant 5", status: 1) }
  let!(:merchant_6) { create(:merchant, name: "Merchant 6", status: 0) }
  let!(:merchant_7) { create(:merchant, name: "Merchant 7", status: 0) }

  let!(:items_m1) { create_list(:item, 5, merchant_id: merchant_1.id, unit_price: 1_000) }
  let!(:items_m2) { create_list(:item, 5, merchant_id: merchant_2.id, unit_price: 1_000) }
  let!(:items_m3) { create_list(:item, 5, merchant_id: merchant_3.id, unit_price: 1_000) }
  let!(:items_m4) { create_list(:item, 5, merchant_id: merchant_4.id, unit_price: 1_000) }
  let!(:items_m5) { create_list(:item, 5, merchant_id: merchant_5.id, unit_price: 1_000) }
  let!(:items_m6) { create_list(:item, 5, merchant_id: merchant_6.id, unit_price: 1_000_000) }

  let!(:customer_1) { create(:customer) }
  let!(:customer_2) { create(:customer) }
  let!(:customer_3) { create(:customer) }
  let!(:customer_4) { create(:customer) }
  let!(:customer_5) { create(:customer) }
  let!(:customer_6) { create(:customer) }
  let!(:customer_7) { create(:customer) }

  static_time_1 = Time.zone.parse('2023-04-13 00:50:37')
  static_time_2 = Time.zone.parse('2023-03-13 00:50:37')
  static_time_3 = Time.zone.parse('2023-02-13 00:50:37')

  let!(:invoice_1) { create(:invoice, customer_id: customer_1.id) }
  let!(:invoice_2) { create(:invoice, customer_id: customer_2.id) }
  let!(:invoice_3) { create(:invoice, customer_id: customer_3.id) }
  let!(:invoice_4) { create(:invoice, customer_id: customer_4.id) }
  let!(:invoice_5) { create(:invoice, customer_id: customer_5.id) }
  let!(:invoice_6) { create(:invoice, customer_id: customer_6.id) }
  let!(:invoice_7) { create(:invoice, customer_id: customer_7.id, created_at: static_time_1) }
  let!(:invoice_8) { create(:invoice, customer_id: customer_7.id) }
  let!(:invoice_9) { create(:invoice, customer_id: customer_7.id, created_at: static_time_2) }
  let!(:invoice_10) { create(:invoice, customer_id: customer_7.id, created_at: static_time_3) }

  let!(:invoice_item_1) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[0].id, status: 1 ) }
  let!(:invoice_item_2) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[1].id, status: 1 ) }
  let!(:invoice_item_3) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[2].id, status: 0 ) }
  let!(:invoice_item_4) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[3].id, status: 0 ) }
  let!(:invoice_item_5) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 2 ) }
  let!(:invoice_item_6) { create(:invoice_item, invoice_id: invoice_8.id, item_id: items_m1[4].id, status: 2 ) }
  let!(:invoice_item_7) { create(:invoice_item, invoice_id: invoice_9.id, item_id: items_m1[3].id, status: 0 ) }
  let!(:invoice_item_8) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 0 ) }
  let!(:invoice_item_9) { create(:invoice_item, invoice_id: invoice_9.id, item_id: items_m1[4].id, status: 0 ) }
  let!(:invoice_item_10) { create(:invoice_item, invoice_id: invoice_10.id, item_id: items_m1[4].id, status: 0 ) }

  let!(:trans_1_s) { create_list(:transaction, 1, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_s) { create_list(:transaction, 2, result: 1, invoice_id: invoice_2.id) }
  let!(:trans_3_s) { create_list(:transaction, 3, result: 1, invoice_id: invoice_3.id) }
  let!(:trans_4_s) { create_list(:transaction, 4, result: 1, invoice_id: invoice_4.id) }
  let!(:trans_5_s) { create_list(:transaction, 5, result: 1, invoice_id: invoice_5.id) }
  let!(:trans_6_f) { create_list(:transaction, 6, result: 0, invoice_id: invoice_6.id) }
  let!(:invoice_item_m1_1) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[0].id, status: 2 ) }
  let!(:invoice_item_m1_2) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[0].id, status: 2 ) }
  let!(:invoice_item_m1_3) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[0].id, status: 2 ) }
  let!(:invoice_item_m1_4) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[0].id, status: 2 ) }
  let!(:invoice_item_m1_5) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[0].id, status: 2 ) }
  let!(:invoice_item_m2_1) { create(:invoice_item, invoice_id: invoice_2.id, item_id: items_m2[0].id, status: 2 ) }
  let!(:invoice_item_m2_2) { create(:invoice_item, invoice_id: invoice_2.id, item_id: items_m2[0].id, status: 2 ) }
  let!(:invoice_item_m2_3) { create(:invoice_item, invoice_id: invoice_2.id, item_id: items_m2[0].id, status: 2 ) }
  let!(:invoice_item_m2_4) { create(:invoice_item, invoice_id: invoice_2.id, item_id: items_m2[0].id, status: 2 ) }
  let!(:invoice_item_m3_1) { create(:invoice_item, invoice_id: invoice_3.id, item_id: items_m3[0].id, status: 2 ) }
  let!(:invoice_item_m3_2) { create(:invoice_item, invoice_id: invoice_3.id, item_id: items_m3[0].id, status: 2 ) }
  let!(:invoice_item_m3_3) { create(:invoice_item, invoice_id: invoice_3.id, item_id: items_m3[0].id, status: 2 ) }
  let!(:invoice_item_m4_1) { create(:invoice_item, invoice_id: invoice_4.id, item_id: items_m4[0].id, status: 2 ) }
  let!(:invoice_item_m4_2) { create(:invoice_item, invoice_id: invoice_4.id, item_id: items_m4[0].id, status: 2 ) }
  let!(:invoice_item_m5_1) { create(:invoice_item, invoice_id: invoice_5.id, item_id: items_m5[0].id, status: 2 ) }
  let!(:invoice_item_m6_1) { create(:invoice_item, invoice_id: invoice_6.id, item_id: items_m6[0].id, status: 0 ) }
end

def top_5_admin_merchant_data
  let!(:merchant_11) { create(:merchant, name: "Merchant 11", status: 1) }
    let!(:merchant_12) { create(:merchant, name: "Merchant 12", status: 1) }
    let!(:merchant_13) { create(:merchant, name: "Merchant 13", status: 1) }
    let!(:merchant_14) { create(:merchant, name: "Merchant 14", status: 1) }
    let!(:merchant_15) { create(:merchant, name: "Merchant 15", status: 1) }
    let!(:merchant_16) { create(:merchant, name: "Merchant 16", status: 1) }

    let!(:item_m11) { create(:item, merchant_id: merchant_11.id, unit_price: 0) }
    let!(:item_m12) { create(:item, merchant_id: merchant_12.id, unit_price: 0) }
    let!(:item_m13) { create(:item, merchant_id: merchant_13.id, unit_price: 0) }
    let!(:item_m14) { create(:item, merchant_id: merchant_14.id, unit_price: 0) }
    let!(:item_m15) { create(:item, merchant_id: merchant_15.id, unit_price: 0) }
    let!(:item_m16) { create(:item, merchant_id: merchant_16.id, unit_price: 0) }

    let!(:customer_11) { create(:customer) }
    let!(:customer_12) { create(:customer) }
    let!(:customer_13) { create(:customer) }
    let!(:customer_14) { create(:customer) }
    let!(:customer_15) { create(:customer) }
    let!(:customer_16) { create(:customer) }

    let!(:invoice_11) { create(:invoice, customer_id: customer_11.id) }
    let!(:invoice_12) { create(:invoice, customer_id: customer_12.id) }
    let!(:invoice_13) { create(:invoice, customer_id: customer_13.id) }
    let!(:invoice_14) { create(:invoice, customer_id: customer_14.id) }
    let!(:invoice_15) { create(:invoice, customer_id: customer_15.id) }
    let!(:invoice_16) { create(:invoice, customer_id: customer_16.id) }

    let!(:invoice_item_11) { create(:invoice_item, item_id: item_m11.id, invoice_id: invoice_11.id, quantity: 1, unit_price: 1_000 ) }
    let!(:invoice_item_12) { create(:invoice_item, item_id: item_m12.id, invoice_id: invoice_12.id, quantity: 1, unit_price: 1_000 ) }
    let!(:invoice_item_13) { create(:invoice_item, item_id: item_m13.id, invoice_id: invoice_13.id, quantity: 1, unit_price: 1_000 ) }
    let!(:invoice_item_14) { create(:invoice_item, item_id: item_m14.id, invoice_id: invoice_14.id, quantity: 1, unit_price: 1_000 ) }
    let!(:invoice_item_15) { create(:invoice_item, item_id: item_m15.id, invoice_id: invoice_15.id, quantity: 1, unit_price: 1_000 ) }
    let!(:invoice_item_16) { create(:invoice_item, item_id: item_m16.id, invoice_id: invoice_16.id, quantity: 1, unit_price: 1_000_000 ) }

    let!(:trans_m11_s) { create_list(:transaction, 5, result: 1, invoice_id: invoice_11.id) }
    let!(:trans_m12_s) { create_list(:transaction, 4, result: 1, invoice_id: invoice_12.id) }
    let!(:trans_m13_s) { create_list(:transaction, 3, result: 1, invoice_id: invoice_13.id) }
    let!(:trans_m14_s) { create_list(:transaction, 2, result: 1, invoice_id: invoice_14.id) }
    let!(:trans_m15_s) { create_list(:transaction, 1, result: 1, invoice_id: invoice_15.id) }
    let!(:trans_m16_f) { create_list(:transaction, 1, result: 0, invoice_id: invoice_16.id) }
end