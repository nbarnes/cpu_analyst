# require "test_helper"

# feature "Timestamps on posts" do

#   scenario "Mass summation displays correctly" do, :js => true do
#     visit root_path

#     page.find('#total_mass').must_equal '0'

#     click('Load Default Values')

#     page.find('#total_mass').must_equal '1555.50'

#   end

#   scenario "Power summation displays correctly" do, :js => true do
#     visit root_path

#     page.find('#total_power_display').must_equal 'Total Power: 0 / 1000'
#     page.find('#excess_power').must_equal '1000 Excess Power'


#     click('Load Default Values')

#     page.find('#total_power_display').must_equal 'Total Power: 833 / 1000'
#     page.find('#excess_power').must_equal '167 Excess Power'
#   end

# end
