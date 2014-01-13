
$ ->

  $('#reset_all_button').click ->
    reset_all_fields()

  $('#reset_CPUs_button').click ->
    $('.gear_slot').each ->
      set_CPUs($(this), 0)
      update_gear_slot($(this))

  $('#load_default_values').click ->
    populate_page(build_defaults())

  build_defaults = () ->
    return defaults =
      HKM__CPUs: 3
      HKM__base_mass_field: "150.00"
      HKM__base_power_field: "100.00"
      ability_1__CPUs: 2
      ability_1__base_mass_field: "200.00"
      ability_1__base_power_field: "70.00"
      ability_2__CPUs: 0
      ability_2__base_mass_field: "70.00"
      ability_2__base_power_field: "100.00"
      ability_3__CPUs: 0
      ability_3__base_mass_field: "275.00"
      ability_3__base_power_field: "40.00"
      jumpjets__CPUs: 5
      jumpjets__base_mass_field: "350.00"
      jumpjets__base_power_field: "60.00"
      passive__CPUs: 0
      passive__base_mass_field: "200.00"
      passive__base_power_field: "80.00"
      plating__CPUs: 4
      plating__base_mass_field: "225.00"
      plating__base_power_field: "20.00"
      primary_weapon__CPUs: 0
      primary_weapon__base_mass_field: "80.00"
      primary_weapon__base_power_field: "250.00"
      secondary_weapon__CPUs: 1
      secondary_weapon__base_mass_field: "60.00"
      secondary_weapon__base_power_field: "150.00"
      servos__CPUs: 0
      servos__base_mass_field: "250.00"
      servos__base_power_field: "50.00"
