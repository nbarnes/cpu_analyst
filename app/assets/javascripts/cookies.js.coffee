
$ ->

  $('#post_cookie').click ->
    $.cookie('CPU_Analyst_frame_data', JSON.stringify(build_frame_data()))

  $('#read_cookie').click ->
    populate_page_from_object(JSON.parse( $.cookie('CPU_Analyst_frame_data') ))