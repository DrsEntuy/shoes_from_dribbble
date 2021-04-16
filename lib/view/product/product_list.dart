part of "product.dart";

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  // Build appbar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "X",
            style: GoogleFonts.libreBaskerville()
                .copyWith(color: mainColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "E",
            style: GoogleFonts.libreBaskerville()
                .copyWith(color: accentColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
      leading: Icon(
        FontAwesomeIcons.bars,
        color: Colors.black,
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(FontAwesomeIcons.search, color: Colors.black))
      ],
    );
  }

  // Build body
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          // Build header
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Our Product",
                    style: titleText,
                  ),
                  Text(
                    "Sort By",
                    style: blackText,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildCategory('Sneakers', 10, blueTextCategory),
                  buildCategory('Watch', 0, blackTextCategory),
                  buildCategory('Backpack', 0, blackTextCategory),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          // Build list of product
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                itemCount: listProduct.length,
                padding: EdgeInsets.only(bottom: 100),
                itemBuilder: (context, index) {
                  return buildContentList(listProduct[index]);
                }),
          ),
        ],
      ),
    );
  }

  // Build Content List
  Widget buildContentList(Map<String, dynamic> listProduct) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Discount information
                Container(
                  decoration: listProduct['disc'] == ''
                      ? null
                      : BoxDecoration(
                          color: Color(0xFFA4E2FC),
                          borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      listProduct['disc'],
                      style: blackTextCategory,
                    ),
                  ),
                ),
                // Like product
                GestureDetector(
                  onTap: () {
                    setState(() {
                      listProduct['isLike'] = !listProduct['isLike'];
                    });
                  },
                  child: Icon(
                    listProduct['isLike']
                        ? FontAwesomeIcons.gratipay
                        : FontAwesomeIcons.solidHeart,
                    color: listProduct['isLike'] ? Colors.red : Colors.grey,
                    size: listProduct['isLike'] ? 17 : 13,
                  ),
                ),
              ],
            ),
            // Product Image
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetail(listProduct)));
              },
              child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image:
                              AssetImage(listProduct['listImage'][0]['image']),
                          fit: BoxFit.cover))),
            ),
            // Product Information
            Text(
              listProduct['name'],
              maxLines: 1,
              style: blueTextTitle,
            ),
            Text(
              Money.fromInt(listProduct['price'], Currency.create('USD', 2))
                  .toString(),
              style: blueTextSubTitle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RatingBarIndicator(
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  rating: listProduct['rating'],
                  itemCount: 5,
                  itemSize: 15,
                  direction: Axis.horizontal,
                ),
                Text(
                  ' (' + listProduct['rating'].toString() + ')',
                  style: GoogleFonts.poppins()
                      .copyWith(color: Colors.black, fontSize: 9),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Build Category
  Widget buildCategory(String title, double elevation, TextStyle style) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.ac_unit,
              size: 18,
            ),
            SizedBox(width: 5),
            Text(title, style: style),
          ],
        ),
      ),
    );
  }
}
