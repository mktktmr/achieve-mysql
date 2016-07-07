$ ->
  $(window).scroll ->
    pageTopBtn = $('#page-top-btn')
    visible = pageTopBtn.is(':visible')
    height = $(window).scrollTop()
    if height > 400
      pageTopBtn.fadeIn() if !visible
    else
      pageTopBtn.fadeOut()
  $(document).on('click', '#move-page-top', ->
    $('html, body').animate({ scrollTop: 0 }, '1000'))
