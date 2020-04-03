$(function(){
	// both api is from timesofindia.indiatimes.com
	var fuel_price_api = "https://toibnews.timesofindia.indiatimes.com/fuelprice/nagpur-fuelprice";
	var market_live_data_api = "https://toibnews.timesofindia.indiatimes.com/marketing/homepagedatanew.json";
	
	
	$.ajax({
		url : fuel_price_api,
		method : 'get',
		success : function(resp) {
			console.log('fuel_price_api resp',resp);
			
		}
	});
	
	$.ajax({
		url : market_live_data_api,
		method : 'get',
		success : function(resp) {
			console.log('market_live_data_api resp',resp);
			
		}
	});
});

