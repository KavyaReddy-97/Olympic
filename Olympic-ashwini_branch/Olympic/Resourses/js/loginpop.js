function signin() {
    debugger
    var username = document.getElementById("txtloginuname");
    var password = document.getElementById("txtloginpassword");

    if (username.value == "AshwiniBoyiteP" && password.value == "12345") {
        //alert("Login successfull");
        window.location = "F:/Downland/Olympic-ashwini_branch/Olympic-ashwini_branch/Olympic/Admin.html";
		
    }
    else if(username.value == "KavyaReddy" && password.value == "12345")
    {
        //alert("Login successfull");
		window.location = "F:/Downland/Olympic-ashwini_branch/Olympic-ashwini_branch/Olympic/Admin.html";
    }
    else
    {
        alert("Login unsuccessfull")
    }
}

function validateOnEnter(event) {
    debugger
    var key = event.which || event.keyCode;
    if (key == 13) { // enter pressed then invoke the validation method
        signin();
    }
} 