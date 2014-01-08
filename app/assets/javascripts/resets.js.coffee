
$ ->

  default_values = [[80, 250, 0],
                    [60, 150, 0],
                    [200, 70, 0],
                    [70, 100, 0],
                    [275, 40, 0],
                    [150, 100, 0],
                    [200, 80, 0],
                    [225, 20, 0],
                    [250, 50, 0],
                    [350, 60, 0]]

  $('#reset_all_button').click ->
    reset_all_fields()

  $('#reset_CPUs_button').click ->
    $('.gear_slot').each ->
      $(this).data('cpu_count', 0)
      remove_all_cpu_images($(this))
      update_gear_slot($(this))

  $('#load_default_values').click ->
    i = 0
    $('.gear_slot').each ->
      $(this).find('.base_mass_field').val( default_values[i][0].toFixed(2) )
      $(this).find('.base_power_field').val( default_values[i][1].toFixed(2) )
      $(this).data('cpu_count', default_values[i][2])
      add_cpu_images($(this), default_values[i][2])
      i++
      update_gear_slot($(this))

