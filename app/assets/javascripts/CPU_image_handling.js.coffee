
$ ->

  window.set_CPU_images = (gear_slot, num) ->
    remove_all_CPU_images(gear_slot)
    for index in [0...num]
      add_CPU_image(gear_slot)

  window.add_CPU_image = (gear_slot) ->
    image_span = gear_slot.find('.cpu_images_display')
    new_image = $('#cpu_image_source .cpu_image').clone()
    image_span.append(new_image)
    new_image.show()

  window.remove_CPU_image = (gear_slot) ->
    gear_slot.find('.cpu_image').last().remove()

  window.remove_all_CPU_images = (gear_slot) ->
    gear_slot.find('.cpu_image').remove()
