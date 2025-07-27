import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class DetailArrivals extends StatefulWidget {
  final String name;
  final double price;
  final String image;

  const DetailArrivals({
    super.key, 
    required this.name, 
    required this.price,
    required this.image,
  });

  @override
  State<DetailArrivals> createState() => _DetailArrivalsState();
}

class _DetailArrivalsState extends State<DetailArrivals> {
  int selectedArrivals = 0;
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Detail Arrivals",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
              // color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*** CAROUSEL */
            Padding(
              padding: EdgeInsetsGeometry.all(50),
              child: _buildCarousel(),
            ),

            //** DETAILARRIVALS */
            Padding(padding: EdgeInsets.all(20), child: _buildArivalDetail()),

            //** PRODUCTS LIKE */
            Padding(padding: EdgeInsets.all(20), child: _buildProductLike()),

            //** PRODUCT LIKE LIST */
            Padding(
              padding: EdgeInsets.all(20),
              child: _buildProductLikeList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 28.0),
        child: Row(
          children: [
            // Icône favori à gauche
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: Icon(Icons.favorite_outline, color: Colors.black),
            ),
            SizedBox(width: 16),
            // Bouton "Add to cart" qui prend tout l'espace restant
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return Center(
      child: SizedBox(
        height: 300.0,
        width: 300.0,
        child: AnotherCarousel(
          boxFit: BoxFit.cover,
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 6.0,
          dotColor: Colors.grey,
          dotIncreasedColor: Color.fromARGB(255, 22, 22, 22),
          dotBgColor: Colors.transparent,
          dotPosition: DotPosition.bottomCenter,
          dotVerticalPadding: 0.0,
          showIndicator: true,
          indicatorBgPadding: 0,
          images: [
            AssetImage(widget.image),
            AssetImage(widget.image),
            AssetImage(widget.image),
          ],
        ),
      ),
    );
  }

  Widget _buildArivalDetail() {
    final litles = ['30ml', '100ml'];
    final  price_reel = widget.price + 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Description produit",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.star, size: 20, color: Colors.amberAccent),
            SizedBox(width: 2),
            Text(
              "4.8(217 Reviews)",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "\$ ${widget.price} USD" ,
              style: TextStyle(
                color: const Color.fromARGB(194, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "\$${price_reel.toStringAsFixed(2)} USD",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2.5,
                decorationColor: Colors.grey,
              ),
            ),
            SizedBox(width: 12),
            Container(
              padding: EdgeInsetsGeometry.only(left: 5),
              height: 20,
              width: 45,
              decoration: BoxDecoration(
                color: const Color.fromARGB(86, 9, 241, 17),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "-20%",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ListView.separated(
            itemBuilder: (context, index) {
              String litle = litles[index];
              bool isSelected = selectedArrivals == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedArrivals = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(13),
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey,
                      width: 1.5,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(litle, style: TextStyle(fontSize: 17)),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
            itemCount: litles.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.archive, color: Colors.green),
            SizedBox(width: 5),
            Text("In Stock", style: TextStyle(color: Colors.green)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.delivery_dining_sharp, color: Colors.grey),
            SizedBox(width: 5),
            Text("Free Delivery", style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.store, color: Colors.grey),
            SizedBox(width: 5),
            Text("Awailate", style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "implify mobile shopping with our product checkout prototype for Flawle! Enhance user experience.",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 20),
        Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: const Color.fromARGB(87, 158, 158, 158),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(24),
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 7,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(87, 158, 158, 158),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Gluta-Hya",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Gluta-Hya is a skincare product that combines the benefits of glutathione and hyaluronic acid to provide deep hydration and skin brightening. It helps to reduce dark spots, improve skin texture, and enhance overall radiance.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Benefits",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "1. Deep hydration for dry skin\n"
                                "2. Brightens and evens out skin tone\n"
                                "3. Reduces the appearance of dark spots\n"
                                "4. Improves skin texture and elasticity\n"
                                "5. Provides antioxidant protection",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.arrow_right_alt,),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(87, 158, 158, 158),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(24),
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 7,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ingredients",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(87, 158, 158, 158),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Gluta-Hya Ingredients",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "1. Glutathione: A powerful antioxidant that helps to brighten the skin and reduce dark spots.\n"
                                "2. Hyaluronic Acid: Provides deep hydration and plumps the skin, reducing the appearance of fine lines.\n"
                                "3. Vitamin C: Brightens the skin and provides additional antioxidant protection.\n"
                                "4. Niacinamide: Improves skin texture and reduces redness.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.arrow_right_alt),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(87, 158, 158, 158),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "How to use",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 7,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "How to use",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(87, 158, 158, 158),
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "To use Gluta-Hya, apply a small amount to clean, dry skin. Gently massage in circular motions until fully absorbed. For best results, use twice daily, morning and evening.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.arrow_right_alt),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductLike() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Products you may also like",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildProductLikeList() {
    final arrivals = [
      {
        'image': 'assets/images/product5.jpg',
        'name': 'Product 1',
        'price': '\$29.99',
        'category': 'Skincare',
      },
      {
        'image': 'assets/images/product2.jpeg',
        'name': 'Product 2',
        'price': '\$39.99',
        'category': 'Fragrance',
      },
      {
        'image': 'assets/images/product3.jpeg',
        'name': 'Product 3',
        'price': '\$49.99',
        'category': 'Hair',
      },
      {
        'image': 'assets/images/product4.jpg',
        'name': 'Product 4',
        'price': '\$59.99',
        'category': 'Eflacre',
      },
    ];

    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: arrivals.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16.0),
        itemBuilder: (context, index) {
          Map<String, dynamic> arrival = arrivals[index];
          return Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailArrivals(
                                name: arrival['name'],
                                price: double.parse(arrival['price'].substring(1)),
                                image: arrival['image'],
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          arrival['image'],
                          width: 200,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        arrival['category'],
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 8),
                      Text(
                        arrival['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    arrival['price'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
