part of "product.dart";

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> listProduct;
  ProductDetail(this.listProduct);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String size = 'US6';
  String color = 'Colors.yellow';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildContent(),
      bottomNavigationBar: buildSummary(),
    );
  }

  // Build AppBar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
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
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.listProduct['isLike'] = !widget.listProduct['isLike'];
              });
            },
            child: Icon(
              widget.listProduct['isLike']
                  ? FontAwesomeIcons.gratipay
                  : FontAwesomeIcons.solidHeart,
              color: widget.listProduct['isLike'] ? Colors.red : Colors.grey,
            ),
          ),
        )
      ],
    );
  }

  // Build body
  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Container(
            decoration: widget.listProduct['disc'] == ''
                ? null
                : BoxDecoration(
                    color: Color(0xffa4e2fc),
                    borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                widget.listProduct['disc'],
                style: GoogleFonts.poppins().copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            color: Colors.white,
            child: Material(
              child: Carousel(
                dotColor: Colors.black26,
                dotIncreasedColor: accentColor,
                dotSize: 5.5,
                dotBgColor: Colors.transparent,
                autoplay: false,
                images: widget.listProduct['listImage']
                    .map(
                      (image) => AssetImage(image['image'].toString()),
                    )
                    .toList(),
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.listProduct['name'],
                            style: GoogleFonts.poppins().copyWith(
                                color: Color(0xff4e55af),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.listProduct['desc'],
                              style: GoogleFonts.poppins().copyWith(
                                  color: Color(0xff4e55af), fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              '(' +
                                  widget.listProduct['rating'].toString() +
                                  ')',
                              style: GoogleFonts.poppins()
                                  .copyWith(color: Colors.black, fontSize: 9))
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Size: ',
                          style: GoogleFonts.poppins().copyWith(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: getContainerSize(),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Available Color: ',
                          style: GoogleFonts.poppins().copyWith(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: getPickColor(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  // Build size
  List<Widget> getContainerSize() {
    List<Widget> list = List();

    for (int i = 0; i < widget.listProduct['listSize'].length; i++) {
      Row row = Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                size = widget.listProduct['listSize'][i]['name'];
              });
            },
            child: Container(
              decoration:
                  size.contains(widget.listProduct['listSize'][i]['name'])
                      ? BoxDecoration(
                          color: Color(0xffa4e2fc),
                          borderRadius: BorderRadius.circular(8))
                      : null,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  widget.listProduct['listSize'][i]['name'],
                  style: GoogleFonts.poppins().copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      );

      list.add(row);
    }
    return list;
  }

  // Build Color
  List<Widget> getPickColor() {
    List<Widget> list = List();

    for (int i = 0; i < widget.listProduct['listColor'].length; i++) {
      Row row = Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                color = widget.listProduct['listColor'][i]['name'].toString();
              });
            },
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.listProduct['listColor'][i]['name']
                            .toString()
                            .contains(color)
                        ? Colors.black
                        : backgroundColor),
                shape: BoxShape.circle,
                color:
                    widget.listProduct['listColor'][i]['name'].withOpacity(.4),
              ),
              child: Container(
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.listProduct['listColor'][i]['name'],
                ),
              ),
            ),
          ),
        ],
      );

      list.add(row);
    }
    return list;
  }

  // Build summary
  Widget buildSummary() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          color: backgroundColor,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  Money.fromInt(widget.listProduct['price'],
                          Currency.create('USD', 2))
                      .toString(),
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  elevation: 0,
                  color: Color(0xFFF6F6F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.shoppingCart,
                        color: Colors.blue,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add To Cart',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
