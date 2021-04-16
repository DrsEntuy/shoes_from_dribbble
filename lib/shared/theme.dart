part of "shared.dart";

const double defaultMargin = 24;

Color mainColor = Color(0xFF4E55AF);
Color accentColor = Color(0xFFA4E2FC);
Color backgroundColor = Color(0xFFE3E3D8);

TextStyle blackText = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);

TextStyle blackTextCategory = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10);

TextStyle blueTextTitle = GoogleFonts.poppins()
    .copyWith(color: Color(0xFF4E55AF), fontWeight: FontWeight.bold);

TextStyle blueTextSubTitle = GoogleFonts.poppins()
    .copyWith(color: Colors.blue, fontWeight: FontWeight.bold);

TextStyle blueTextCategory = GoogleFonts.poppins().copyWith(
    color: Color(0xFF4E55AF), fontWeight: FontWeight.bold, fontSize: 10);

TextStyle titleText = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
