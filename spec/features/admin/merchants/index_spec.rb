require "rails_helper"

RSpec.describe "admin merchants index", type: :feature do
  describe "as an admin, when I visit admin merchants index" do
    load_test_data

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

    it "shows enabled and disabled merchants in separate blocks" do
      visit admin_merchants_path

      within "#enabled-merchants" do
        expect(page).to have_content("#{merchant_4.name}")
        expect(page).to have_content("#{merchant_5.name}")
        expect(page).to_not have_content("#{merchant_6.name}")
        expect(page).to_not have_content("#{merchant_7.name}")
      end

      within "#disabled-merchants" do
        expect(page).to have_content("#{merchant_6.name}")
        expect(page).to have_content("#{merchant_7.name}")
        expect(page).to_not have_content("#{merchant_4.name}")
        expect(page).to_not have_content("#{merchant_5.name}")
      end
    end

    it "has buttons to enable or disable that merchant and updates that merchant" do
      visit admin_merchants_path

      within "##{merchant_5.id}" do
        expect(merchant_5.status).to eq("enabled")
        expect(page).to have_button("Disable")
        click_button("Disable")
        expect(current_path).to eq(admin_merchants_path)
      end

      visit admin_merchants_path

      expect(merchant_5.status).to eq("enabled")

      within "##{merchant_6.id}" do
        expect(page).to have_button("Enable")
        click_button("Enable")
        expect(current_path).to eq(admin_merchants_path)
      end

      visit admin_merchants_path

      expect(merchant_6.status).to eq("disabled")
    end

    it "has a link to and can create a new merchant" do
      visit admin_merchants_path

      within "#new-merchant" do
        expect(page).to have_link("New Merchant", :href => new_admin_merchant_path)
      end
    end
  end

  describe "as an admin, when I see top 5 admin merchants" do
    top_5_admin_merchant_data

    it "has a link to and can create a new merchant" do
      visit admin_merchants_path

      within "#top-merchants" do
        expect(merchant_11.name).to appear_before(merchant_12.name)
        expect(merchant_12.name).to appear_before(merchant_13.name)
        expect(merchant_13.name).to appear_before(merchant_14.name)
        expect(merchant_14.name).to appear_before(merchant_15.name)
        expect(page).to have_content("#{merchant_11.name} - $5,000.00 in sales")
        expect(page).to have_content("#{merchant_12.name} - $4,000.00 in sales")
        expect(page).to have_content("#{merchant_13.name} - $3,000.00 in sales")
        expect(page).to have_content("#{merchant_14.name} - $2,000.00 in sales")
        expect(page).to have_content("#{merchant_15.name} - $1,000.00 in sales")
        expect(page).to_not have_content(merchant_16.name)
      end
    end
  end
end