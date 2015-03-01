$( document ).ready( function(){
	$('.footer').click(function(e){
		//alert('click:' + e.clientX);
		var clickHorizProportion = e.clientX / $(window).width();
		$('body, html').animate({scrollLeft: ($('.wideSurvey').width() * clickHorizProportion) }, 800);
	});
});

