# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Transaction.destroy_all
InvoiceItem.destroy_all
Item.destroy_all
Invoice.destroy_all
Merchant.destroy_all
Customer.destroy_all


merchant_1 = Merchant.create!(name: "Amazon", status: 0)
merchant_2 = Merchant.create!(name: "Target", status: 0)
merchant_3 = Merchant.create!(name: "King Soopers", status: 0)
merchant_4 = Merchant.create!(name: "Merchant 4", status: 1)
merchant_5 = Merchant.create!(name: "Merchant 5", status: 1)
merchant_6 = Merchant.create!(name: "Merchant 6", status: 0)
merchant_7 = Merchant.create!(name: "Merchant 7", status: 0)