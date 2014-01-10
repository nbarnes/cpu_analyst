
$ ->

  default_values = [[80, 250, 0],
                    [60, 150, 1],
                    [200, 70, 0],
                    [70, 100, 2],
                    [275, 40, 0],
                    [150, 100, 3],
                    [200, 80, 0],
                    [225, 20, 4],
                    [250, 50, 0],
                    [350, 60, 5]]

  $('#reset_all_button').click ->
    reset_all_fields()

  $('#reset_CPUs_button').click ->
    $('.gear_slot').each ->
      set_CPUs($(this), 0)
      update_gear_slot($(this))

  $('#load_default_values').click ->
    i = 0
    $('.gear_slot').each ->
      $(this).find('.base_mass_field').val( default_values[i][0].toFixed(2) )
      $(this).find('.base_power_field').val( default_values[i][1].toFixed(2) )
      set_CPUs($(this), default_values[i][2])
      update_gear_slot($(this))
      i++
