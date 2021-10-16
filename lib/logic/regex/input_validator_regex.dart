RegExp passwordRule = RegExp(r'/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/');
String passwordErrorMsg =
    'Password must be minimum eight characters, at least one letter, one number and one special character!';

RegExp nameRule = RegExp(r'const name_rule = /^[a-zA-Z0-9_-]([\sa-zA-Z0-9_-]){1,18}[a-zA-Z0-9_-]$/');
String nameErrorMsg =
    "Name must be 3 to 20 alphanumerical characters. '-' '_' and space are allowed. Cannot start or end with a space.";
