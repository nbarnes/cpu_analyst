
$ ->

  $('#add_cpu_image').click ->
    console.log('bob')
    new_image = $('#cpu_image_source .cpu_image').clone()
    console.log(new_image)
    new_image.show()
    $('#cpu_images_area').append(new_image)