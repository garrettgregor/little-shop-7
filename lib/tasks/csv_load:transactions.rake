require "csv"

namespace :csv_load do
  desc "Import Transactions Data from CSV"
  task :transactions => :environment do
    ActiveRecord::Base.connection.reset_pk_sequence!("Transaction")

    CSV.foreach("./db/data/transactions.csv", headers: true, header_converters: :symbol) do |row| 
      Transaction.create!(row.to_hash)
    end
  end
end