

$(function(){
var size=3.0*$('#image1').width();
$("#image1").mouseover(function(event) {
var $target=$(event.target);

if($target.is('img'))
{
$("<img id='tip' src='"+$target.attr("src")+"'>").css({
"height":size,
"width":size,
}).appendTo($("#imgtest"));/*將當前所有匹配元素追加到指定元素內部的末尾位置。*/
}
}).mouseout(function() {
$("#tip").remove();/*移除元素*/
})


})

function total(id)
{
/*計算單個的價格*/
var quantity=document.getElementById("quantity"+id).value;
var price=document.getElementById("price"+id).value;
var smallTotal=quantity*price;
var smallT=document.getElementById("smallTotal"+id);
smallT.innerHTML=smallTotal;


/*計算總價格*/
var totalPrice=0;
for(var a=1;a<3;a++){
var quantity=document.getElementById("quantity"+a).value;
var price=document.getElementById("price"+a).value;
var smallTotal=quantity*price;
totalPrice=totalPrice+smallTotal;
}
var total=document.getElementById("total");
total.innerHTML=totalPrice;
}

function initialize()
{
var totalPrice=0;
for(var a=1;a<3;a++){
var quantity=document.getElementById("quantity"+a).value;
var price=document.getElementById("price"+a).value;
var smallTotal=quantity*price;
totalPrice=totalPrice+smallTotal;
/*alert(smallTotal);*/
var smallT=document.getElementById("smallTotal"+a);
smallT.innerHTML=smallTotal;
}
/*取出購物車的所有商品的價格總和*/
var total=document.getElementById("total");
total.innerHTML=totalPrice;
}












       
