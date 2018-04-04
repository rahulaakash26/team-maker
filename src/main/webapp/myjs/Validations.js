// function validate(form) {
//     var name = document.forms["register-form"]["name"].value;
//     if (name.length<2){
//         return false;
//     }
//     else {
//         return true;
//     }
// }
$(function () {
    $("#register-form").validate({
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            name: {
                minlength: 2,
                maxlength: 16
            },
            email: {
                // Specify that email should be validated
                // by the built-in "email" rule
                email: true,
            },
            pwd: {
                minlength: 5,
                maxlength: 15
            },
            cnf_pwd: {
                minlength: 5,
                maxlength: 15,
                equalTo: "#pwd"
            }
        },
        // Specify validation error messages
        messages: {
            name: "Please enter a valid name",
            pwd: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long",
                maxlength: "Your password must be at most 15 characters long"
            },
            email: {
                email: "Please enter a valid email address"
            },
            cnf_pwd: "Password do not match"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function (form) {
            form.submit();
        }
    });
});