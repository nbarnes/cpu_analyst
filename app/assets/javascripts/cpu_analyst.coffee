$ ->
  $('#click_me').click ->
    $('#total_mass_display').val("clicked")
    console.log($('#total_mass_display').val())

  $('.gear_slot').change ->
    console.log('gear slot changed')
    recalculate_total_mass_and_power()

  recalculate_total_mass_and_power = () ->
    console.log('recalculateTotalMassAndPower called')
    total_mass = ""
    total_power = ""
    $('.gear_slot_mass').each ->
      $(this).val(100)
      total_mass = total_mass + $(this).val()
    $('.gear_slot_power').each ->
      $(this).val(200)
      total_power = total_power + $(this).val()
    $('#total_mass_display').val( total_mass )
    $('#total_power_display').val( total_power )
