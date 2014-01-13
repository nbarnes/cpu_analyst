
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

  build_zeroes = () ->
    return zeroes =
      servos__CPUs: 0
      servos__base_mass_field: "0.00"
      servos__base_power_field: "0.00"
      HKM__CPUs: 0
      HKM__base_mass_field: "0.00"
      HKM__base_power_field: "0.00"
      ability_1__CPUs: 0
      ability_1__base_mass_field: "0.00"
      ability_1__base_power_field: "0.00"
      ability_2__CPUs: 0
      ability_2__base_mass_field: "0.00"
      ability_2__base_power_field: "0.00"
      ability_3__CPUs: 0
      ability_3__base_mass_field: "0.00"
      ability_3__base_power_field: "0.00"
      jumpjets__CPUs: 0
      jumpjets__base_mass_field: "0.00"
      jumpjets__base_power_field: "0.00"
      passive__CPUs: 0
      passive__base_mass_field: "0.00"
      passive__base_power_field: "0.00"
      plating__CPUs: 0
      plating__base_mass_field: "0.00"
      plating__base_power_field: "0.00"
      primary_weapon__CPUs: 0
      primary_weapon__base_mass_field: "0.00"
      primary_weapon__base_power_field: "0.00"
      secondary_weapon__CPUs: 0
      secondary_weapon__base_mass_field: "0.00"
      secondary_weapon__base_power_field: "0.00"

  window.save_session = () ->
    $.cookie('CPU_Analyst_frame_data', JSON.stringify(build_frame_data()))

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

    save_session()
    recalculate_total_mass_and_power()

  window.recalculate_total_mass_and_power = () ->

    total_mass = 0
    $('.adjusted_mass_field').each ->
      total_mass = total_mass + parseFloat( $(this).val() )
    $('#total_mass').text( total_mass.toFixed(2) )
    update_movement_mod(total_mass)

    total_power = 0
    $('.adjusted_power_field').each ->
      total_power = total_power + parseFloat( $(this).val() )
    $('#total_power').text( total_power.toFixed(0) )
    $('#excess_power_display').html( (maximum_power - total_power).toFixed(0) )

    $("#total_CPUs").html(current_global_cpu_count())

  window.set_CPUs = (gear_slot, num) ->
    gear_slot.data('cpu_count', num)
    set_CPU_images(gear_slot, num)
    update_gear_slot(gear_slot)

  window.build_frame_data = () ->
    frame_data = new Object()
    $('.gear_slot').each ->
      mass_tag = $(this).attr('id') + '__base_mass_field'
      power_tag = $(this).attr('id') + '__base_power_field'
      cpu_tag = $(this).attr('id') + '__CPUs'

      frame_data[mass_tag] = $(this).find('.base_mass_field').val()
      frame_data[power_tag] = $(this).find('.base_power_field').val()
      frame_data[cpu_tag] = $(this).data('cpu_count')
    return frame_data

  window.populate_page = (source) ->
    for own key, value of source
      split_key = key.split('__')
      slot_id = split_key[0]
      constraint_id = split_key[1]
      gear_slot = $("#" + slot_id)
      if (constraint_id == 'CPUs')
        set_CPUs(gear_slot, value)
      else
        field_selector = "#" + slot_id + " ." + constraint_id
        $(field_selector).val(value)
    $('.gear_slot').each ->
      update_gear_slot($(this))

  window.reset_all_fields = () ->
    populate_page(build_zeroes())

  # RUN AT PAGE LOAD

  # cookie_data = JSON.parse( $.cookie('CPU_Analyst_frame_data') )
  # reset_all_fields()
  # populate_page(cookie_data)

  cookie = $.cookie('CPU_Analyst_frame_data')
  try
    session_data = JSON.parse( cookie )
  catch e
    # debugging statement should not be published to live site
    # console.log("catching JSON parse error: #{ e }")
  reset_all_fields()
  populate_page(session_data)

  # END RUN AT PAGE LOAD