$(function() {
	if($('li').find('.startLink').length){
		$('li').find('.startLink').click();
	}else{
		var userName = $('#topUsername').text();
		var element = $('<div><h3>Welcome '+userName+'</h3></div>');
		$('.mainContainer').empty().html($(element));
		//$(element).center();
		$(element).css({
	        'position' : 'absolute',
	        'left' : '50%',
	        'top' : '50%',
	        'margin-left' : function() {return -$(this).outerWidth()/2},
	        'margin-top' : function() {return -$(this).outerHeight()/2}
	    });
		$('.footer').addClass('hide');
	}
	
});
function loadPage(obj, link, eleClassName, eleLiClassName, VorH) {
	$('.loading').removeClass('hide');
	$('.mainContainer').addClass('hide');
	$('.footer').addClass('hide');
	var slash = String(link).charAt(0);
	if (slash != "/") {
		link = "/" + link;
	}
	$.ajax({
	  url : link,
	  async : true,
	  success : function(resp) {
		  $('.mainContainer').empty().html(resp);
		  $('.dataTables_length').find('select').select2({
			  minimumResultsForSearch : -1
		  });
		  $('#ui-datepicker-div').remove();
		  $('.content-body').removeClass('pd-0');
		  $('body').removeClass('app-contact');
		  $('.mainContainer').removeClass('ht-100p');
		  feather.replace();
		  if (obj == null) {
			  $('.nav-aside').find('.moduleLi').removeClass('active');
			  $('.nav-aside').find('.active').removeClass('active');
			  $('.nav-aside').find('.activeLink').removeClass('activeLink');
			  $('.nav-aside').find('.' + eleLiClassName).addClass('active');
			  $('.nav-aside').find('.' + eleLiClassName).find('.' + eleClassName).addClass('activeLink');
		  } else {
			  $('.nav-aside').find('.moduleLi').removeClass('active');
			  $('.nav-aside').find('.active').removeClass('active');
			  $('.nav-aside').find('.activeLink').removeClass('activeLink');
			  $(obj).closest('.moduleLi').addClass('active');
			  $(obj).closest('.moduleLi').addClass('show');
			  $(obj).addClass('activeLink');
		  }
		  setTimeout(function() {
			  if(obj && $(obj).attr('data-addright')=="false"){
				  $('.addNewBtn').addClass('hide');
			  }
			  if(obj && $(obj).attr('data-editright')=="false"){
				  $('.editRecordBtn').addClass('hide');  
			  }
			  if(obj && $(obj).attr('data-deleteright')=="false"){
				  $('.deleteRecordBtn').addClass('hide');
			  }
			  
			  $('.loading').addClass('hide');
			  $('.mainContainer').removeClass('hide');
			  $('.footer').removeClass('hide');
			  
		  }, 1000);
		  $('html,body').animate({
			  scrollTop : parseInt($('body').offset().top)
		  }, 1000);
	  },
		  error : function(e) {
			if (e.status == 404) {
				$.get("/err404", function(data) {
					$('.mainContainer').empty().html(data);
				});
			} else if (e.status == 500) {
				$.get("/err500", function(data) {
					$('.mainContainer').empty().html(data);
				});
			} else if (e.status == 503) {
				$.get("/err503", function(data) {
					$('.mainContainer').empty().html(data);
				});
			} else if (e.status == 505) {
				$.get("/err505", function(data) {
					$('.mainContainer').empty().html(data);
				});
			} else {
				$('.mainContainer').empty().html('<h1>' + e.status + ' Error Occured !</h1>');
			}
			setTimeout(function() {
				$('.loading').addClass('hide');
				$('.mainContainer').removeClass('hide');
				$('.footer').removeClass('hide');
			}, 1000);
		},
	});
}
function reloadPage() {
	$('.moduleLi').find('.activeLink').click();
}
/*
 * $(function() { if (window.history && window.history.pushState) {
 * window.history.pushState('', null, loadPage(null,
 * $('.default-link').data('page-link'))); $(window).on('popstate', function() { //
 * alert('Browser Back button was pressed.'); document.location.href = '#';
 * 
 * }); } });
 */




window.alert = function (message,type) {
	var alertTyp =null;
	var alertTitle =null;
	var alertIcon =null;
	if(type){
		type = type.toUpperCase();
	}
	if(type && type=='S'){
		alertIcon = 'check-circle';
		alertTyp = 'green';
		alertTitle = 'Success';
	}else if(type && type=='E'){
		alertIcon = 'times-circle';
		alertTyp = 'red';
		alertTitle = 'Error';
	}else if(type && type=='D'){
		alertIcon = 'times-circle';
		alertTyp = 'red';
		alertTitle = 'Error';
	}else if(type && type=='W'){
		alertIcon = 'exclamation';
		alertTyp = 'orange';
		alertTitle = 'Warning';
	}else{
		alertIcon = 'exclamation';
		alertTyp = 'blue';
		alertTitle = 'Alert';
	}
	

	$.confirm({
		icon: 'fa fa-'+alertIcon,
	    title: alertTitle+' !',
	    columnClass: 'medium',
	    content: message,
	    type: alertTyp,
	    theme: 'bootstrap',
	    animationSpeed: 100,
	    typeAnimated: true,
	    buttons: {
	        Ok: {
	            text: 'Ok',
	            btnClass: 'btn-'+alertTyp.toLowerCase(),
	            keys: ['enter'],
	            action: function(){
    	            
	            }
	        }
	    }
	});
};


$( document ).ajaxError(function( event, jqxhr, settings ) {
	console.log('ajaxError::', event, jqxhr, settings)
	//var alertData = '<p>Status : <b style="color: #b30e0e;">' + (jqxhr.responseJSON.status) + '</b><br/>Error : <b style="color: #b30e0e;">' + (jqxhr.responseJSON.error) + '</b><br/>Message : <b style="color: #b30e0e;">' + (jqxhr.responseJSON.message) + '</b></p>';
	//alert(alertData,'E');
});


jQuery.fn.center = function () {
	this.css({
        'position' : 'absolute',
        'left' : '50%',
        'top' : '50%',
        'margin-left' : function() {return -$(this).outerWidth()/2},
        'margin-top' : function() {return -$(this).outerHeight()/2}
    });
    return this;
}