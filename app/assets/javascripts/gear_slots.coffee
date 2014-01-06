
$ ->

  CPU_mods = [1, 0.90, 0.81, 0.73, 0.66, 0.59]

  movement_mods =       [0.5, 0.7,  0.8,  0.9,  0.95, 1,    1.05, 1.1,  1.15, 1.2]
  movement_mod_masses = [1.0, 0.94, 0.89, 0.84, 0.79, 0.74, 0.69, 0.64, 0.59, 0.49]

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

    ###########
    $.cookie('cookie', 'bob')
    alert($.cookie('cookie'))
    ###########

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
