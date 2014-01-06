
$ ->

  # Declared in the startup file because CoffeeScript's load order is
  # wonky; if I want to reference this function in the onLoad, I need to
  # define it here first, or I get an
  # 'recalculate_total_mass_and_power is not defined ' exception
  recalculate_total_mass_and_power = () ->
    total_mass = 0
    $('.adjusted_mass_field').each ->
      total_mass = total_mass + parseFloat( $(this).val() )
    $('#total_mass').text( Math.round( total_mass * 100) / 100)

    total_power = 0
    $('.adjusted_power_field').each ->
      total_power = total_power + parseFloat( $(this).val() )
    $('#total_power').text( Math.round( total_power * 100) / 100)

  # RUN AT PAGE LOAD

  $('.constraint_field').each ->
    $(this).val(0)
  $('.cpu_count_display').each ->
    $(this).val(0)
  recalculate_total_mass_and_power()

  # END RUN AT PAGE LOAD