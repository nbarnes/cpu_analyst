
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
    $('.constraint_field').each ->
      $(this).val(0)
    $('.gear_slot').each ->
      $(this).data('cpu_count', 0)
    $('.cpu_count_display').each ->
      $(this).val(0)
    recalculate_total_mass_and_power()

  $('#reset_CPUs_button').click ->
    $('.gear_slot').each ->
      $(this).data('cpu_count', 0)
    $('.cpu_count_display').each ->
      $(this).val(0)
      update_gear_slot($(this).parents('.gear_slot'))

  $('#load_default_values').click ->
    i = 0
    $('.gear_slot').each ->
      $(this).find('.base_mass_field').val(default_values[i][0])
      $(this).find('.base_power_field').val(default_values[i][1])
      $(this).data('cpu_count', default_values[i][2])
      $(this).find('.cpu_count_display').val(default_values[i][2])
      i++
      update_gear_slot($(this))
