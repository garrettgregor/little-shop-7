require "csv"

namespace :csv_load do
  desc "Import Invoice Items Data from CSV"
  task :invoice_items => :environment do
    ActiveRecord::Base.connection.reset_pk_sequence!("InvoiceItem")
    
    CSV.foreach("./db/data/invoice_items.csv", headers: true, header_converters: :symbol) do |row| 
      InvoiceItem.create!(row.to_hash)
    end
  end
end