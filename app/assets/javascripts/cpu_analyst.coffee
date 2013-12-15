$ ->
  $('.gear_slot').change ->
    recalculateTotalMassAndPower

recalculateTotalMassAndPower ->
  $('.gear_slot_mass').each (mass_slot)
    total_mass += $(i).text
  $('.gear_slot_power').each (power_slot)
    total_power += $(i).text
  $(#total_mass).text = total_mass
  $(#total_power).text = total_power


