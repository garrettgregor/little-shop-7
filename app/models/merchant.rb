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
    self.invoices.joins(:invoice_items)
    .where("invoice_items.status != 2")
    .order(:created_at)
    .group(:id)
  end

  def enabled_items
    items.where(status: :enabled)
  end

  def disabled_items
    items.where(status: :disabled)
  end

  def top_five_items
    Item.joins(invoices: :transactions)
    .where('transactions.result = ? and items.merchant_id = ?', "1", self.id)
    .select("items.*, SUM(invoice_items.unit_price * invoice_items.quantity) as total_revenue")
    .group(:id)
    .order(total_revenue: :desc)
    .limit(5)
  end

end