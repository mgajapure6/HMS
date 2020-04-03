$(function() {
	/*$('.nav-sub-link-tab').on('click',function(){
		$(this).closest('.d-lg-flex').find('.tab-content').removeClass('hide');
	});
	*/
//nav-sub-link-tab-click
	$('.nav-sub-link-tab-click').on('click', function(){
		//alert()
			
			
			/*$(this).closest('.d-lg-flex').find('.twoFill').empty();
			$(this).closest('.d-lg-flex').find('.threeFill').empty();
			$('.moduleLvl').clone().appendTo( ".threeFill" );*/

	});
});

function getModuleSUbMenu(obj){
	var menuLvl = $(obj).data('flexlvl');
	var menuId = $(obj).data('menuid');
	var moduleId = $(obj).data('moduleid');
	var parentId = null;
	if(menuLvl>1){
		parentId = menuId;
	}else{
		parentId = $(obj).data('parentid');
	}
	var menuType = $(obj).data('menutype');
	var heading = $(obj).text();
	
	$.ajax({
		url:'menu/getSubMenu',
		method:'POST',
		data:{
			parentId:parentId,
			menuId:menuId,
			moduleId:moduleId,
			menuType:menuType
		},
		success:function(res){
			var li= '<li class="nav-label">'+heading+'</li>';
			JSON.parse(res).forEach(function(obj, i) {
				li = li+ '<li class="nav-sub-item">';
				if(!obj.hasLink){
					li = li+'<a href="javascript:;" onclick="getModuleSUbMenu(this)" class="nav-sub-link nav-sub-link-tab nav-sub-link-tab-click" data-flexlvl="'+(menuLvl+1)+'" data-parentid="'+obj.parentMenuId+'" data-menuid="'+obj.id+'" data-moduleid="'+obj.moduleId+'" data-menutype="ML_'+(menuLvl+1)+'">'+obj.menuName+' <i class="fa fa-angle-right mg-l-auto"></i></a>';
				}else{
					li = li+'<a href="javascript:;" class="nav-sub-link nav-sub-link-new" data-page-link="'+obj.link+'">'+obj.menuName+'</a>';
				}
				li = li+'</li>';
				console.log(obj);
			});
			
			var flexFill ='<div class="flex-fill flexLvl_'+(menuLvl+1)+'" style="padding-left: 10px;"><ul class="nav nav-tabs flex-column wd-150 moduleLvl">' +li+'</ul></div>';
			for (var i =(menuLvl+1); i<=10;i++){
				$(obj).closest('.d-lg-flex').find('.flexLvl_'+i).remove();
			}
			$(obj).closest('.d-lg-flex').append(flexFill);
		}
	});
}

