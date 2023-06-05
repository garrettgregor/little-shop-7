require "rails_helper"

RSpec.describe "admin merchants index", type: :feature do
  load_test_data

  describe "as an admin" do
    describe "when I visit admin merchants index" do
      it "shows the names of each merchant in the system" do
        visit admin_merchants_path

        within "#top-merchants" do
          expect(page).to have_content(merchant_1.name)
          expect(page).to have_content(merchant_2.name)
          expect(page).to have_content(merchant_3.name)
        end
      end

      it "has a link to go to merchant show page" do
        visit admin_merchants_path

        within "#top-merchants" do
          expect(page).to have_link("#{merchant_1.name}", :href => admin_merchant_path(merchant_1))
          expect(page).to have_link("#{merchant_2.name}", :href => admin_merchant_path(merchant_2))
          expect(page).to have_link("#{merchant_3.name}", :href => admin_merchant_path(merchant_3))
        end
      end
    end
  end
end