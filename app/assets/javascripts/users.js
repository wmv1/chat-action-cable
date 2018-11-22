setInterval(function(){   atualizaOnOffLine() }, 10000);
//setInterval(function() { $('#list-users').load('users'); }, 1000);


function atualizaOnOffLine(){
var xmlhttp = new XMLHttpRequest();
var url = "http://ruby.kwcraft.com.br:8080/json_users";
var myArr;
xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        var myArr = JSON.parse(this.responseText);
         
      for (var i = myArr.length - 1; i >= 0; i--) {
		
         	try{
                  if(myArr[i]["current_user_id"]!=myArr[i]["id"]){
	        	 if(myArr[i]["online"] == true){
		         document.getElementById ("status-on-off-"+myArr[i]['id'] ).textContent = "online"
	                }else{
				document.getElementById ("status-on-off-"+myArr[i]['id'] ).textContent = "offline"

	            } 
                  }
 	       }catch(err) {
             	}
      }
    }
};
xmlhttp.open("GET", url, true);
xmlhttp.send();

}
