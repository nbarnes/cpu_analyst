
$ ->

  default_values = [[80, 350],
                    [60, 150],
                    [200, 60],
                    [70, 100],
                    [350, 40],
                    [150, 100],
                    [150, 80],
                    [300, 20],
                    [250, 40],
                    [400, 40]]

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
      console.log("setting slot to mass #{default_values[i][0]}, power #{default_values[i][1]}")
      $(this).find('.base_mass_field').val(default_values[i][0])
      $(this).find('.base_power_field').val(default_values[i][1])
      i++
