class InvoiceItem < ApplicationRecord
  self.primary_key = :id
  belongs_to :item
  belongs_to :invoice
end