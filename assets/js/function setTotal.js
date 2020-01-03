      

            window.onload = function total() {
            var count = document.getElementById("count");
            var inc = document.getElementById("inc");
            var dec = document.getElementById("dec");
            inc.onclick = function() {
                count.value = parseInt(count.value) + 1;

            };
            dec.onclick = function() {
            	if(count.value>0){
            		count.value = parseInt(count.value) - 1;
            	}
            	else{
            		count.value = 0;
            	}
                
            };
        var quantity=document.getElementById("count");
        var price=document.getElementById("price0").value;
        var smallTotal=quantity*price;
        var smallT=document.getElementById("total");
        smallT.innerHTML=smallTotal+"元";
        };


   /* function total(){

        var quantity=document.getElementById("count").value;
        var price=document.getElementById("price0").value;
        var smallTotal=quantity*price;
        var smallT=document.getElementById("total");
        smallT.innerHTML=smallTotal;

    }*/



       