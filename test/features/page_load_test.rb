require "test_helper"

feature "Front page" do
  scenario "Base page displays" do
    visit root_path
    page.must_have_content "CPU Analyst for Firefall"
  end
end
