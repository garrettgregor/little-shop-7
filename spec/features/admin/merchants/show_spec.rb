require "rails_helper"

RSpec.describe "admin merchant show", type: :feature do
  load_test_data

  describe "as an admin" do
    describe "when I visit admin merchant's show page" do
      it "displays the name of the merchant" do
        visit admin_merchant_path(merchant_1)

        expect(page).to have_content(merchant_1.name)
        expect(page).to_not have_content(merchant_2.name)
        expect(page).to_not have_content(merchant_3.name)
      end
    end
  end
end