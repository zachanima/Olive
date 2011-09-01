jQuery ->
  window.notice = (text) ->
    if text
      $('#notice').html(text).show()
    else
      $('#notice').fadeOut('slow')

  window.bindEdit = (selector, url) ->
    $(selector).click ->
      $.ajax
        dataType: 'script'
        url: url
        beforeSend: -> notice('Loading ...')
        complete: -> notice()
      false

  window.bindNotice = (selector, text) ->
    $(selector).bind('ajax:beforeSend', -> notice(text))
    $(selector).bind('ajax:complete', -> notice())

  window.page = $('div[data-page]')

  $('#notice').click -> notice()
  setTimeout ->
    notice()
  , 3000

  /* TODO: you know what to do. */
  $('#countdown').html(parseInt(((new Date()).setFullYear(2012,0,28) - Date.now()) / 86400000) + ' days left')
