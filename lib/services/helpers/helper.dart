

class Helper {
  static splitDisplayName(String fullName) {
    String firstName = '';
    String lastName = '';

    var sname = fullName.trim().split(" ");

    var n = sname.length % 2 != 0 ? (sname.length / 2) - 1 : sname.length / 2;
    for (var i = 0; i < sname.length; i++) {
      if (i < n)
        firstName += sname[i] + ' ';
      else
        lastName += sname[i] + ' ';
    }
    return [firstName.trim(), lastName.trim()];
  }

}
