
$ ->

  default_values = [[80, 250],
                    [60, 150],
                    [200, 70],
                    [70, 100],
                    [275, 40],
                    [150, 100],
                    [200, 80],
                    [225, 20],
                    [250, 50],
                    [350, 60]]

  $('#reset_all_button').click ->
    $('.constraint_field').each ->
      $(this).val(0)
    $('.cpu_count_display').each ->
      $(this).val(0)
    recalculate_total_mass_and_power()

  $('#reset_CPUs_button').click ->
    $('.cpu_count_display').each ->
      $(this).val(0)
      update_gear_slot($(this).parents('.gear_slot'))

  $('#load_default_values').click ->
    i = 0
    $('.gear_slot').each ->
      $(this).find('.base_mass_field').val(default_values[i][0])
      $(this).find('.base_power_field').val(default_values[i][1])
      i++
      update_gear_slot($(this))
