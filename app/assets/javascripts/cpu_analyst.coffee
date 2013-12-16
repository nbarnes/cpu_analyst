$ ->

  # Declared way up here in the file because CoffeeScript's load order is
  # wonky; if I want to reference this function in the onLoad, I need to
  # define it here first, or I get an 'Undefined is not a function' exception
  recalculate_total_mass_and_power = () ->
    console.log('recalculateTotalMassAndPower called')
    total_mass = 0
    total_power = 0
    $('.gear_slot_mass').each ->
      total_mass = total_mass + parseInt( $(this).val() )
    $('.gear_slot_power').each ->
      total_power = total_power + parseInt( $(this).val() )
    $('#total_mass_display').val( total_mass )
    $('#total_power_display').val( total_power )

  # RUN AT PAGE LOAD

  $('.gear_slot_mass').each ->
    $(this).val(0)
  $('.gear_slot_power').each ->
    $(this).val(0)
  recalculate_total_mass_and_power()

  # END RUN AT PAGE LOAD

  $('.gear_slot').change ->
    recalculate_total_mass_and_power()

  $('.mass_slot').change ->
    $(this).parent().find('.adjusted_mass_slot').val( $(this).val() )
