      

        window.onload = function () {
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
        
        }


        function total(){
        var inc = document.getElementById("inc");
        var dec = document.getElementById("dec");   
        var count = document.getElementById("count").value;
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
        var price=document.getElementById("price0").value;
        var smallTotal=count*price;
        var smallT=document.getElementById("total");
        smallT.innerHTML=smallTotal+"元";

    }



       