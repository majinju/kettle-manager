function navShow(){
	var $level1Menu = $('.J-level1-nav');
	var $level2Menu = $level1Menu.find('ul');
	$level1Menu.find('li p').on('click',function(){
		var $this = $(this);
		if ( $this.hasClass('active') ) {
			return
		} else {
			$level2Menu
				.slideUp(400)
				.find('li')
				.removeClass('active');
			$this
				.addClass('active')
				.parent()
				.siblings('li')
				.find('p')
				.removeClass('active');
			$this
				.siblings('ul')
				.slideDown(400)
				.find('li')
				.first()
				.addClass('active');
		}
	});
	$level2Menu.find('li').on('click',function(){
		var $this = $(this);
		if ( $this.hasClass('active') ) {
			return;
		} else {
			$this
				.addClass('active')
				.siblings('li')
				.removeClass('active');
		}
	})
}

navShow();