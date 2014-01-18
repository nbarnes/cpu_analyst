require "test_helper"

feature "Constraint summations" do

  scenario "Mass summation displays correctly", js: true do
    visit root_path

    page.find('#total_mass').must_have_content '0'

    click_on 'Load Default Values'

    page.find('#total_mass').must_have_content '1555.50'
  end

  scenario "Power summation displays correctly", js: true do
    visit root_path

    page.find('#total_power_display').must_have_content 'Total Power: 0 / 1000'
    page.find('#excess_power').must_have_content '1000 Excess Power'

    click_on 'Load Default Values'

    page.find('#total_power_display').must_have_content 'Total Power: 833 / 1000'
    page.find('#excess_power').must_have_content '167 Excess Power'
  end

end
