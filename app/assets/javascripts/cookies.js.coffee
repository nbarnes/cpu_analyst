
$ ->

  $('#post_cookie').click ->
    save_session()

  $('#read_cookie').click ->
    populate_page(JSON.parse( $.cookie('CPU_Analyst_frame_data') ))

