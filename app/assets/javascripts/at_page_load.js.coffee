
$ ->

  window.maximum_mass = 2000
  window.maximum_power = 1000

  window.CPU_mods = [1, 0.90, 0.81, 0.73, 0.66, 0.59]

  movement_mods = [[1.20, 0.00],
                   [1.15, 0.49],
                   [1.10, 0.59],
                   [1.05, 0.64],
                   [1.00, 0.69],
                   [0.95, 0.74],
                   [0.90, 0.79],
                   [0.80, 0.84],
                   [0.70, 0.89],
                   [0.50, 0.94]]

  window.current_global_cpu_count = () ->
    total_CPUs = 0
    $('.gear_slot').each ->
      total_CPUs = total_CPUs + $(this).data('cpu_count')
    return total_CPUs

  update_movement_mod = (current_mass) ->
    mass_ratio = current_mass / maximum_mass
    movement_mod = 1.20

    for mod in movement_mods
      if mass_ratio >= mod[1]
        movement_mod = mod[0]

    $('#movement_mod_display').html( (movement_mod * 100).toFixed(0) + "%")

  window.update_gear_slot = (gear_slot) ->
    CPU_count = gear_slot.data('cpu_count')

    base_mass = gear_slot.find('.base_mass_field').val()
    adjusted_mass_field = gear_slot.find('.adjusted_mass_field')
    adjusted_mass_field.val ( (base_mass * CPU_mods[CPU_count]).toFixed(2) )

    base_power = gear_slot.find('.base_power_field').val()
    adjusted_power_field = gear_slot.find('.adjusted_power_field')
    adjusted_power_field.val ( (base_power * CPU_mods[CPU_count]).toFixed(2) )

    recalculate_total_mass_and_power()

  window.recalculate_total_mass_and_power = () ->
    total_mass = 0
    $('.adjusted_mass_field').each ->
      total_mass = total_mass + parseFloat( $(this).val() )
    $('#total_mass').text( Math.round(total_mass * 100) / 100)
    update_movement_mod(total_mass)
    total_power = 0
    $('.adjusted_power_field').each ->
      total_power = total_power + parseFloat( $(this).val() )
    $('#total_power').text( Math.round(total_power * 100) / 100)
    $('#excess_power_display').html( (maximum_power - total_power).toFixed(0) )
    $("#total_CPUs").html(current_global_cpu_count())

  window.reset_all_fields = () ->
    $('.constraint_field').each ->
      $(this).val(0.toFixed(2))
    $('.gear_slot').each ->
      set_CPUs($(this), 0)
    recalculate_total_mass_and_power()

  window.set_CPUs = (gear_slot, num) ->
    gear_slot.data('cpu_count', num)
    set_CPU_images(gear_slot, num)
    update_gear_slot(gear_slot)

  # RUN AT PAGE LOAD

  reset_all_fields()

  # END RUN AT PAGE LOAD