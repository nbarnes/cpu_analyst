
$ ->

  CPU_mods = [1, 0.90, 0.81, 0.73, 0.66, 0.59]

  # Declared way up here in the file because CoffeeScript's load order is
  # wonky; if I want to reference this function in the onLoad, I need to
  # define it here first, or I get an 'Undefined is not a function' exception
  recalculate_total_mass_and_power = () ->
    console.log 'hit recalc total mass and power'
    total_mass = 0
    $('.adjusted_mass_field').each ->
      total_mass = total_mass + parseFloat( $(this).val() )
    $('#total_mass_display').val( total_mass )

    total_power = 0
    $('.adjusted_power_field').each ->
      total_power = total_power + parseFloat( $(this).val() )
    $('#total_power_display').val( total_power )

  # RUN AT PAGE LOAD

  $('.gear_slot').each ->
    $(this).val(0)
  $('.cpu_count_display').each ->
    $(this).val(5)
  recalculate_total_mass_and_power()

  # END RUN AT PAGE LOAD

  $('.base_constraint_field').change ->
    update_gear_slot($(this).parents('.slot'))

  $('.remove_cpu_button').click ->
    gear_slot = $(this).parents('.slot')
    cpu_count_element = gear_slot.find('.cpu_count_display')
    current_CPU_count = parseInt( cpu_count_element.val() )
    if current_CPU_count > 0
      cpu_count_element.val( current_CPU_count - 1 )
    update_gear_slot(gear_slot)

  $('.add_cpu_button').click ->
    gear_slot = $(this).parents('.slot')
    cpu_count_element = gear_slot.find('.cpu_count_display')
    current_CPU_count = parseInt( cpu_count_element.val() )
    if current_CPU_count < 5
      cpu_count_element.val( current_CPU_count + 1 )
    update_gear_slot(gear_slot)

  update_gear_slot = (gear_slot) ->
    CPU_count = parseInt( gear_slot.find('.cpu_count_display').val() )

    base_mass = gear_slot.find('.base_mass_field').val()
    adjusted_mass_field = gear_slot.find('.adjusted_mass_field')
    adjusted_mass_field.val ( base_mass * CPU_mods[CPU_count] )

    base_power = gear_slot.find('.base_power_field').val()
    adjusted_power_field = gear_slot.find('.adjusted_power_field')
    adjusted_power_field.val ( base_power * CPU_mods[CPU_count] )

    recalculate_total_mass_and_power()