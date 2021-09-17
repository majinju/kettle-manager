$(function(){
  (function(){
    if (!!window.ActiveXObject || 'ActiveXObject' in window){
      var w = $(window).width()
      if (w < 1200){
        $('.bk-err .err-man').css({
          width: '128px',
          height: '150px',
          bottom: '60px',
          right: '60px'
        })
        $('.bk-err p .err-span').css({
          'font-size': '14px',
          'line-height': '40px'
        })
        $('.bk-err p .err-a').css({
          'font-size': '12px'
        })
        $('.bk-err p.err-tip').css({
          'margin-top': '10px'
        })
      }else if (w < 1366){
        $('.bk-err .err-man').css({
          width: '220px',
          height: '257px',
          bottom: '60px',
          right: '60px'
        })
        $('.bk-err p .err-span').css({
          'font-size': '14px',
          'line-height': '40px'
        })
        $('.bk-err p .err-a').css({
          'font-size': '12px'
        })
        $('.bk-err p.err-tip').css({
          'margin-top': '10px'
        })
      }
    }
    resizeF()
  })()
  /**
   *  describe  重设显示图标居中位置
   *  @example: 
   *  @return   {[type]}  [description]
   */
  function resizeF() {
    var bkp = $('.bk-err p')
    var pH = 0
    $.each(bkp, function(i){
      pH += bkp.eq(i).height()
    })
    $('.bk-err p:first-child').css('margin-top', $(window).height() / 2 - pH / 2 + 'px')
  }
  $(window).on('resize', resizeF)
})