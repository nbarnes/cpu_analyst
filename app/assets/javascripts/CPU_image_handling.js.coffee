
$ ->

  window.remove_cpu_image = (gear_slot) ->
    image_span = gear_slot.find('.cpu_images_display')
    image_span.find('.cpu_image').last().remove()

  window.add_cpu_image = (gear_slot) ->
    image_span = gear_slot.find('.cpu_images_display')
    new_image = $('#cpu_image_source .cpu_image').clone()
    image_span.append(new_image)
    new_image.show()

  window.add_cpu_images = (gear_slot, num) ->

  window.remove_all_cpu_images = (gear_slot) ->
    gear_slot.find('.cpu_image').remove()
