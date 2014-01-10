
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

  $('#post_cookie').click ->
    $.cookie('frame_data', JSON.stringify(build_frame_data()))

  $('#read_cookie').click ->
    populate_page_from_object(JSON.parse( $.cookie('frame_data') ))