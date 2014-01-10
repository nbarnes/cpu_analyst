
$ ->

  window.build_frame_data = () ->
    frame_data = new Object()
    $('.gear_slot').each ->
      mass_tag = $(this).attr('id') + '-base_mass_field'
      power_tag = $(this).attr('id') + '-base_power_field'
      cpu_tag = $(this).attr('id') + '-CPUs'

      frame_data[mass_tag] = $(this).find('.base_mass_field').val()
      frame_data[power_tag] = $(this).find('.base_power_field').val()
      frame_data[cpu_tag] = $(this).data('cpu_count')
    return frame_data

  window.populate_page_from_object = (frame_data) ->
    for own key, value of frame_data
      split_key = key.split('-')
      slot_id = split_key[0]
      constraint_id = split_key[1]
      gear_slot = $("#" + slot_id)
      if (constraint_id == 'CPUs')
        gear_slot.data("cpu_count", value)
        add_cpu_images(gear_slot, value)
      else
        field_selector = "#" + slot_id + " ." + constraint_id
        $(field_selector).val(value)
    $('.gear_slot').each ->
      update_gear_slot($(this))


  $('#post_cookie').click ->
    $.cookie('frame_data', JSON.stringify(build_frame_data()))

  $('#read_cookie').click ->
    populate_page_from_object(JSON.parse( $.cookie('frame_data') ))