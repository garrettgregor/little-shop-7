require "rails_helper"

RSpec.describe "admin merchant update", type: :feature do
  load_test_data

  describe "as an admin" do
    describe "when I visit admin merchant's show page" do
      it "keeps the merchant's info populated and then updates that merchant with information inputted" do
        disabled_merchant = Merchant.create!(name: "Disabled Merchant", status: 0)

        visit admin_merchant_path(disabled_merchant)

        expect(page).to have_content("Merchant Name: #{disabled_merchant.name}")
        expect(page).to have_content("Merchant Status: #{disabled_merchant.status}")
        expect(disabled_merchant.name).to eq("Disabled Merchant")
        expect(disabled_merchant.status).to eq("disabled")

        click_link("Update Merchant")

        expect(page.has_field?("Name", with: disabled_merchant.name)).to eq(true)
        # expect(page).to has_checked_field?("disabled")
        # expect(page.has_field?(disabled_merchant[status])).to eq(true)
        # expect(page.has_field?("merchant_status_disabled")).to eq(true)
        # expect(page.has_field?("merchant[status]")).to eq(true)
        # expect(page).to have_field("merchant[status]")
        expect(page).to have_checked_field("status_disabled")
        expect(page).to have_unchecked_field("status_enabled")
        # save_and_open_page
        # expect(page.has_field?("Enabled")).to eq(true)
        # I don't know how to explicitly check that this is populated by instance's attributes
        # expect(page).to have_field(:status, status_disabled: true)
        # find_field("Disabled").value.should_not be_blank
        # expect(page.has_field?(, with: disabled_merchant.status)).to eq(true)
        # expect(page).to have_unchecked_field(:status)
        ## why doesn't this pass? ^ when used a check box

        fill_in("Name", with: "Updated Disabled Merchant")
        choose("Enabled")
        click_button("Submit")

        disabled_merchant = Merchant.find(disabled_merchant.id)
        # ^ this does the same things as this...
        # disabled_merchant.reload
        expect(disabled_merchant.name).to eq("Updated Disabled Merchant")
        expect(disabled_merchant.status).to eq("enabled")
        expect(page).to have_content("Merchant Information Updated")
      end

      it "keeps the merchant's info populated and then updates that merchant with information inputted" do
        enabled_merchant = Merchant.create!(name: "Enabled Merchant", status: 1)

        visit admin_merchant_path(enabled_merchant)

        expect(page).to have_content("Merchant Name: #{enabled_merchant.name}")
        expect(page).to have_content("Merchant Status: #{enabled_merchant.status}")
        expect(enabled_merchant.name).to eq("Enabled Merchant")
        expect(enabled_merchant.status).to eq("enabled")

        click_link("Update Merchant")

        expect(page.has_field?("Name", with: enabled_merchant.name)).to eq(true)
        expect(page).to have_unchecked_field("status_disabled")
        expect(page).to have_checked_field("status_enabled")

        fill_in("Name", with: "Updated Enabled Merchant")
        choose("Enabled")
        click_button("Submit")

        enabled_merchant = Merchant.find(enabled_merchant.id)

        expect(enabled_merchant.name).to eq("Updated Enabled Merchant")
        expect(enabled_merchant.status).to eq("enabled")
        expect(page).to have_content("Merchant Information Updated")
      end

      it "keeps the merchant's info as it was" do
        enabled_merchant = Merchant.create!(name: "Enabled Merchant", status: 1)

        visit admin_merchant_path(enabled_merchant)

        expect(page).to have_content("Merchant Name: #{enabled_merchant.name}")
        expect(page).to have_content("Merchant Status: #{enabled_merchant.status}")
        expect(enabled_merchant.name).to eq("Enabled Merchant")
        expect(enabled_merchant.status).to eq("enabled")

        click_link("Update Merchant")

        expect(page.has_field?("Name", with: enabled_merchant.name)).to eq(true)
        expect(page).to have_unchecked_field("status_disabled")
        expect(page).to have_checked_field("status_enabled")

        click_button("Submit")

        enabled_merchant = Merchant.find(enabled_merchant.id)

        expect(enabled_merchant.name).to eq("Enabled Merchant")
        expect(enabled_merchant.status).to eq("enabled")
        expect(page).to have_content("Merchant Information Updated")
      end
    end
  end
end