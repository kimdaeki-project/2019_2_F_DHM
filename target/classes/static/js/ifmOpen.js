//헤현
var titleA = new Array();
var firstimageA = new Array();
var addr1A = new Array();
var arCodeA = new Array();

function wish(p, t, firstimage, addr1, arCode, e) {

		if($(p).children().hasClass("wish-active")){

			$(p).children().removeClass("wish-active");
			parent.spliceSch(t,firstimage,addr1,arCode);
		
		}else{

			$(p).children().addClass("wish-active");
			parent.saveSch(t,firstimage,addr1,arCode);
	
			event.stopImmediatePropagation();
		}
}