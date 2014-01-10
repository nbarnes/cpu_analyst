
$ ->

  window.build_frame_data = () ->
    frame_data = new Object()

    $('.gear_slot').each ->
      mass_tag = $(this).attr('id') + '_mass'
      power_tag = $(this).attr('id') + '_power'
      cpu_tag = $(this).attr('id') + '_cpus'

      frame_data[mass_tag] = $(this).find('.base_mass_field').val()
      frame_data[power_tag] = $(this).find('.base_power_field').val()
      frame_data[cpu_tag] = $(this).data('cpu_count')

  window.populate_page_from_object = () ->


    return frame_data

  $('#post_cookie').click ->
    $.cookie('frame_data', JSON.stringify(build_frame_data()))

  $('#read_cookie').click ->
    console.log( JSON.parse( $.cookie('frame_data') ) )