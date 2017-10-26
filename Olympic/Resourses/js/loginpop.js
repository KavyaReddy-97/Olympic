function signin() {
    debugger
    var username = document.getElementById("txtusername");
    var password = document.getElementById("txtpassword");

    if (username.value == "Ashwini Boyite P" && password.value == "12345") {
        //alert("Login successfull");
        window.location = "http://localhost:58602/Templates/Login.html";
    }
    else if(username.value == "Kavya Reddy" && password.value == "12345")
    {
        alert("Login successfull");
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