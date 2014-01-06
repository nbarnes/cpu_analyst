
$ ->

  CPU_mods = [1, 0.90, 0.81, 0.73, 0.66, 0.59]

  movement_mods = [[1.20, 0.49],
                   [1.15, 0.59],
                   [1.10, 0.64],
                   [1.05, 0.69],
                   [1.00, 0.74],
                   [0.95, 0.79],
                   [0.90, 0.84],
                   [0.80, 0.89],
                   [0.70, 0.94],
                   [0.50, 1.00]]

  # Declared up here because CoffeeScript's load order is
  # wonky; if I want to reference this function in the onLoad, I need to
  # define it here first, or I get an 'undefined is not a function' exception
  update_movement_mod = (current_mass) ->
    maximum_mass = 2000
    mass_ratio = current_mass / maximum_mass
    movement_mod = 1.20

    for mod in movement_mods
      if mass_ratio >= mod[1]
        movement_mod = mod[0]

    $('#movement_mod_display').html( (movement_mod * 100).toFixed(2) + "%")

  # Declared up here because CoffeeScript's load order is
  # wonky; if I want to reference this function in the onLoad, I need to
  # define it here first, or I get an 'undefined is not a function' exception
  recalculate_total_mass_and_power = () ->
    total_mass = 0
    $('.adjusted_mass_field').each ->
      total_mass = total_mass + parseFloat( $(this).val() )
    $('#total_mass').text( Math.round( total_mass * 100) / 100)
    update_movement_mod(total_mass)
    total_power = 0
    $('.adjusted_power_field').each ->
      total_power = total_power + parseFloat( $(this).val() )
    $('#total_power').text( Math.round( total_power * 100) / 100)
    $('#excess_power_display').html(2000 - total_power)

  # RUN AT PAGE LOAD

  $('.constraint_field').each ->
    $(this).val(0)
  $('.cpu_count_display').each ->
    $(this).val(0)
  recalculate_total_mass_and_power()

  # END RUN AT PAGE LOAD

  $('.base_constraint_field').change ->
    update_gear_slot($(this).parents('.gear_slot'))

  $('.remove_cpu_button').click ->
    gear_slot = $(this).parents('.gear_slot')
    cpu_count_element = gear_slot.find('.cpu_count_display')
    current_CPU_count = parseInt( cpu_count_element.val() )
    if current_CPU_count > 0
      cpu_count_element.val( current_CPU_count - 1 )
    update_gear_slot(gear_slot)

  $('.add_cpu_button').click ->
    gear_slot = $(this).parents('.gear_slot')
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

  $('.add_cpu_for_mass').click ->
    gear_slots = $(this).parents('#page_layout_table').find('.gear_slot')
    best_slot_for_CPU = gear_slots.first()
    gear_slots.each ->
      if mass_saved_for_next_CPU_on_slot(this) > mass_saved_for_next_CPU_on_slot(best_slot_for_CPU)
        best_slot_for_CPU = this
    $(best_slot_for_CPU).find('.add_cpu_button').click()

  $('.add_cpu_for_power').click ->
    gear_slots = $(this).parents('#page_layout_table').find('.gear_slot')
    best_slot_for_CPU = gear_slots.first()
    gear_slots.each ->
      if power_saved_for_next_CPU_on_slot(this) > power_saved_for_next_CPU_on_slot(best_slot_for_CPU)
        console.log("bob")
        best_slot_for_CPU = this
    $(best_slot_for_CPU).find('.add_cpu_button').click()

  mass_saved_for_next_CPU_on_slot = (gear_slot) ->
    base_mass = parseFloat( $(gear_slot).find('.base_mass_field').val() )
    CPU_count = parseInt( $(gear_slot).find('.cpu_count_display').val() )
    if CPU_count < 5
      next_CPU_count = CPU_count + 1
    else
      next_CPU_count = CPU_count
    (base_mass * CPU_mods[CPU_count]) - (base_mass * CPU_mods[next_CPU_count])

  power_saved_for_next_CPU_on_slot = (gear_slot) ->
    base_power = parseFloat( $(gear_slot).find('.base_power_field').val() )
    CPU_count = parseInt( $(gear_slot).find('.cpu_count_display').val() )
    if CPU_count < 5
      next_CPU_count = CPU_count + 1
    else
      next_CPU_count = CPU_count
    (base_power * CPU_mods[CPU_count]) - (base_power * CPU_mods[next_CPU_count])
