class Merchant < ApplicationRecord
  self.primary_key = :id
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  enum :status, [:disabled, :enabled]

  def top_5_customers
    Customer.joins(:transactions)
    .select("customers.id, customers.first_name, customers.last_name, COUNT(transactions.id) AS transaction_count")
    .where(transactions: { result: 1 } )
    .group("customers.id, customers.first_name, customers.last_name")
    .order("transaction_count DESC")
    .limit(5)
  end

  def not_shipped_items
    # require 'pry'; binding.pry
    # Item.joins(invoices: [:invoice_items])
    # .select("items.*, invoices.created_at as creation_date, invoice_items.status")
    # .where("invoice_items.status != 2")
    # .order(:creation_date)
    items.joins(:invoice_items)
    .where("invoice_items.status != 2")
    .order('invoice_items.created_at ASC')
  end

  def enabled_items
    items.where(status: :enabled)
  end

  def disabled_items
    items.where(status: :disabled)
  end

end