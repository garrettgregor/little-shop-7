require "csv"

namespace :csv_load do
  desc "Import Invoices Data from CSV"
  task :invoices => :environment do
    ActiveRecord::Base.connection.reset_pk_sequence!("Invoice")

    CSV.foreach("./db/data/invoices.csv", headers: true, header_converters: :symbol) do |row| 
      Invoice.create!(row.to_hash)
    end
  end
end