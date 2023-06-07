class InvoiceItem < ApplicationRecord
  self.primary_key = :id
  belongs_to :item
  belongs_to :invoice
  enum :status, [:pending, :packaged, :shipped]

  def cents_to_dollar
    unit_price/100.00
  end

  def format_unit_price
    (unit_price / 100.0).round(2).to_s
  end
  
end