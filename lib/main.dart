import 'package:flutter/material.dart';

const String productDescription =
    '''In publishing and graphic design,Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.''';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MyHomePage(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.purpleAccent,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: IconButton(
              padding: EdgeInsets.all(3),
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFirstExpanded(context),
        buildSecondExpanded(),
        Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                  text: '\$',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '100',
                      style:
                          TextStyle(fontSize:30, fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.7,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50)
                )
              ),
            )
          ],
        ))),
      ],
    );
  }

  Expanded buildSecondExpanded() {
    return Expanded(
        flex: 3,
        child: Container(
          padding: EdgeInsets.only(left: 15),
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  productDescription,
                  style: TextStyle(
                    color: Colors.black,
                    wordSpacing: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 20,
                    width: 130,
                    color: Colors.grey,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (quantity != 0) {
                                quantity--;
                              }
                            });
                          },
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${quantity}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Expanded buildFirstExpanded(BuildContext context) {
    return Expanded(
        flex: 4,
        child: FractionallySizedBox(
          alignment: Alignment.topLeft,
          heightFactor: 0.8,
          widthFactor: 1.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(30))),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Men Shoe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Size - 9',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Brand : Adidas',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                buildPositioned(context)
              ],
            ),
          ),
        ));
  }

  Positioned buildPositioned(BuildContext context) {
    return Positioned(
        bottom: -70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            //    crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 40,
                    ),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width - 230,
              ),
              Image.asset(
                'images/shoesrbg.png',
                height: 150,
                width: 150,
              ),
            ],
          ),
        ));
  }
}
