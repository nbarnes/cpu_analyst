require "test_helper"

feature "per CPU constraint adjustments" do

  scenario "Mass adjustments work", js: true do
    visit root_path

    click_on 'Reset All'

    page.find('#primary_weapon .base_mass_field').value().must_equal('0.00')
    page.find('#primary_weapon .adjusted_mass_field').value().must_equal('0.00')

    page.find('#primary_weapon .base_mass_field').set('200')
    page.find('#primary_weapon .base_mass_field').trigger('change')

    page.find('#primary_weapon .base_mass_field').value().must_equal('200.00')
    page.find('#primary_weapon .adjusted_mass_field').value().must_equal('200.00')

    page.find('#primary_weapon .add_cpu_button').click()

    page.find('#primary_weapon .adjusted_mass_field').value().must_equal('180.00')

  end

  # scenario "Power adjustments work", js: true do
  #   visit root_path
  # end

end
