
$ ->

  $('.base_constraint_field').change ->
    new_val = parseFloat($(this).val())
    $(this).val(new_val.toFixed(2))
    update_gear_slot($(this).parents('.gear_slot'))

  $('.remove_cpu_button').click ->
    gear_slot = $(this).parents('.gear_slot')
    current_CPU_count = gear_slot.data('cpu_count')
    if current_CPU_count > 0
      gear_slot.data('cpu_count', current_CPU_count - 1 )
      remove_CPU_image(gear_slot)
    update_gear_slot(gear_slot)

  $('.add_cpu_button').click ->
    gear_slot = $(this).parents('.gear_slot')
    current_CPU_count = gear_slot.data('cpu_count')
    if current_CPU_count < 5
      if current_global_cpu_count() < 18
        gear_slot.data('cpu_count', current_CPU_count + 1 )
        add_CPU_image(gear_slot)
      else
        $("#total_CPUs_display").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100)
    update_gear_slot(gear_slot)

  $('#add_cpu_for_mass').click ->
    gear_slots = $(this).parents('#page_layout_table').find('.gear_slot')
    best_slot_for_CPU = gear_slots.first()
    gear_slots.each ->
      if mass_saved_for_next_CPU_on_slot(this) > mass_saved_for_next_CPU_on_slot(best_slot_for_CPU)
        best_slot_for_CPU = this
    $(best_slot_for_CPU).find('.add_cpu_button').click()

  $('#add_cpu_for_power').click ->
    gear_slots = $(this).parents('#page_layout_table').find('.gear_slot')
    best_slot_for_CPU = gear_slots.first()
    gear_slots.each ->
      if power_saved_for_next_CPU_on_slot(this) > power_saved_for_next_CPU_on_slot(best_slot_for_CPU)
        best_slot_for_CPU = this
    $(best_slot_for_CPU).find('.add_cpu_button').click()

  mass_saved_for_next_CPU_on_slot = (gear_slot) ->
    base_mass = parseFloat( $(gear_slot).find('.base_mass_field').val() )
    CPU_count = $(gear_slot).data('cpu_count')
    if CPU_count < 5
      next_CPU_count = CPU_count + 1
    else
      next_CPU_count = CPU_count
    (base_mass * CPU_mods[CPU_count]) - (base_mass * CPU_mods[next_CPU_count])

  power_saved_for_next_CPU_on_slot = (gear_slot) ->
    base_power = parseFloat( $(gear_slot).find('.base_power_field').val() )
    CPU_count = $(gear_slot).data('cpu_count')
    if CPU_count < 5
      next_CPU_count = CPU_count + 1
    else
      next_CPU_count = CPU_count
    (base_power * CPU_mods[CPU_count]) - (base_power * CPU_mods[next_CPU_count])
