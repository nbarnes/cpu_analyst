
$ ->

  $('#post_cookie').click ->
    console.log('post cookie clicked')
    save_session()

  $('#read_cookie').click ->
    console.log('read cookie clicked')
    populate_page(JSON.parse( $.cookie('CPU_Analyst_frame_data') ))

