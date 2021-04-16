part of "page.dart";

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Stack(children: [
        Container(
          color: backgroundColor,
        ),
        SafeArea(
            child: Container(
          color: backgroundColor,
        )),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: <Widget>[
            ProductList(),
            Center(child: Text("Page 2")),
            Center(child: Text("Page 3")),
            Center(child: Text("Page 4")),
          ],
        ),
        customNavBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 46,
            width: 46,
            margin: EdgeInsets.only(bottom: 42),
            child: Stack(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  elevation: 0,
                  backgroundColor: mainColor,
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(
                      FontAwesomeIcons.shoppingCart,
                      size: 15,
                      color: accentColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Center(
                      child: new Text(
                        '2',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  // Create custom nav bar
  Widget customNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: bottomNavBarIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.home,
                      size: 20,
                    ),
                    title: Text("")),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.solidHeart,
                      size: 20,
                    ),
                    title: Text("")),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.clipboardCheck,
                      size: 20,
                    ),
                    title: Text("")),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.solidUser,
                      size: 20,
                    ),
                    title: Text("")),
              ],
            ),
          ),
        ),
      );
}

// Create Clipper for bottom nav bar
class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
