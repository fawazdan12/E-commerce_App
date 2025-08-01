import 'package:flutter/material.dart';
import 'detail_arrival.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int selectedCategory = 2;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Text(
                  'Abdoul',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //** BANNER */
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildBanner(), 
              ),
        
              //*** CATEGORY */
              SizedBox(height: 20,),
             Padding(
              padding: 
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildCategory(),
              ),
            
              //*** LIST_CATEGORY */
              // SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildListCategory(),
              ),
              
              //*** ARRIVAL */
              // SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildArival(),
              ),
            
              //*** ARRIVAL_LIST */
              // SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildArrivalList(),
              ),

              //*** BRANDS */
              // SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildBrands(),
              ),

              //*** RECOMMENDATE */
              // SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildBrandList(),
              ),

              //*** RECOMMENDATE */
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _builRecommendate(),
              ),

              //*** RECOMMENDATION_LIST */
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: _buildRecommendationList(),
              ),
              //*** BLOG */
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(41, 58, 55, 55),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: _buildBlog(),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: _buildBlogList(),
                    ),
                  ],
                ),
              ),
            ],
          )
  
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        backgroundColor: const Color.fromARGB(7, 18, 17, 17),
        selectedItemColor: Colors.black,
        onTap: (index) {
          setCurrentIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  height: 3,
                  width: 24,
                  decoration: BoxDecoration(
                    color: _currentIndex == 0 ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            label: '',
            
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.menu),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  height: 3,
                  width: 24,
                  decoration: BoxDecoration(
                    color: _currentIndex == 1 ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.message),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  height: 3,
                  width: 24,
                  decoration: BoxDecoration(
                    color: _currentIndex == 2 ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_bag),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  height: 3,
                  width: 24,
                  decoration: BoxDecoration(
                    color: _currentIndex == 3 ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  height: 3,
                  width: 24,
                  decoration: BoxDecoration(
                    color: _currentIndex == 4 ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            label: ''
          ),
        ],
      ),
    );
  
  }

  Widget _buildBanner(){
    final banners = [
      {
        'name': 'Murad',
        'name_product': 'Yotinol Youth',
        'description': 'Simplify mobile shopping with our product\ncheckout prototype for Flawle! \nEnhance user experience, reduce cart abandonment, and boost conversions.',
        'images': 'assets/images/img1.png',
        'button_description': '17 % | Buy now'
      },
      {
        'name': 'Murad',
        'name_product': 'Yotinol Youth',
        'description': 'Simplify mobile shopping with our product\ncheckout prototype for Flawle! \nEnhance user experience, reduce cart abandonment, and boost conversions.',
        'images': 'assets/images/img2.png',
        'button_description': '12 % | Buy now'
      },
      {
        'name': 'Murad',
        'name_product': 'Yotinol Youth',
        'description': 'Simplify mobile shopping with our product\ncheckout prototype for Flawle! \nEnhance user experience, reduce cart abandonment, and boost conversions.',
        'images': 'assets/images/img3.png',
        'button_description': '15 % | Buy now'
      },
      {
        'name': 'Murad',
        'name_product': 'Yotinol Youth',
        'description': 'Simplify mobile shopping with our product\ncheckout prototype for Flawle! \nEnhance user experience, reduce cart abandonment, and boost conversions.',
        'images': 'assets/images/img4.png',
        'button_description': '18 % | Buy now'
      },
    ];
    final List<Color> bannerColors = [
      const Color.fromRGBO(127, 209, 79, 1.0), // vert
      const Color.fromARGB(255, 241, 132, 45),  // jaune
      const Color.fromARGB(255, 124, 109, 102),  // rouge
      const Color.fromARGB(255, 100, 39, 3), // bleu
    ];
    return SizedBox(
      height: 280,
      child: ListView.separated(
        itemBuilder: (context, index) {
          Map<String, dynamic> banner = banners[index];
          final color = index < bannerColors.length ? bannerColors[index] : bannerColors.last;
          return Container(
            height: 250,
            width: 340,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // Texte à gauche
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          banner['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        Text(
                          banner['name_product'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),
                        ),
                        Text(
                          banner['description'],
                          style: TextStyle(
                            color: const Color.fromARGB(77, 0, 0, 0),
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 6,),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(color.withOpacity(0.0)),
                          ),
                          onPressed: (){}, 
                          child: Text(
                            banner['button_description'],
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image à droite
                  SizedBox(
                    width: 120,
                    height: 160,
                    child: Image.asset(
                      banner['images'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16.0,),
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildCategory(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildListCategory(){
    final categorylist = [
      'Fragrance',
      'Hair',
      'Skincare',
      'Eflacre',
      'Hydrate',
      'Santepara',
      'Posay'
    ];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          String category = categorylist[index];

          return GestureDetector(
            onTap: (){
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(97, 158, 158, 158),
                  width: 1.5,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          );
        }
        ),
    );
  }

  Widget _buildBrands(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Brands",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildBrandList() {
    final brands = [
      'assets/images/logo1.png',
      'assets/images/logo2.png',
      'assets/images/logo3.png',
      'assets/images/logo4.png',
      'assets/images/logo5.png',
    ];
    
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 16.0,),
        itemCount: brands.length,
        itemBuilder: (context, index) {
          String brand = brands[index];
          return Container(
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
              child: Image.asset(
                brand,
                height: 40,
                width: 80,
                fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }

  Widget _buildArival(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "New Arrivals",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildArrivalList() {
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
        'price': '39.99',
        'category': 'Fragrance',
      },
      {
        'image': 'assets/images/product3.jpeg',
        'name': 'Product 3',
        'price': '49.99',
        'category': 'Hair',
      },
      {
        'image': 'assets/images/product4.jpg',
        'name': 'Product 4',
        'price': '59.99',
        'category': 'Eflacre',
      },
    ];
    
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: arrivals.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16.0,),
        itemBuilder: (context, index) {
          Map<String,dynamic> arrival = arrivals[index];
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
                        onTap: (){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => DetailArrivals(
                              name: arrival['name'],
                              price: double.parse(arrival['price'].substring(1)),
                              image: arrival['image'],
                            ),)
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
                      SizedBox(
                        height: 6,
                      ),
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
                                    "\$${arrival['price']}",
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
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
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

  Widget _builRecommendate(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recommended for you",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationList(){
    final recommendations = [
      {
        'image': 'assets/images/rec1.jpg',
        'name': 'Product A',
        'price': '19.99',
        'category': 'Skincare',
      },
      {
        'image': 'assets/images/rec2.jpg',
        'name': 'Product B',
        'price': '29.99',
        'category': 'Fragrance',
      },
      {
        'image': 'assets/images/rec3.jpg',
        'name': 'Product C',
        'price': '39.99',
        'category': 'Hair',
      },
    ];
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16.0,),
        itemBuilder: (context, index) {
          Map<String,dynamic> recommendation = recommendations[index];
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
                        onTap: (){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => DetailArrivals(
                              name: recommendation['name'],
                              price: double.parse(recommendation['price'].substring(1)),
                              image: recommendation['image'],
                            )),
                          );
                        },
                        child: Image.asset(
                          recommendation['image'],
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
                        recommendation['category'],
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 8),
                      Text(
                        recommendation['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
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
                                    "\$${recommendation['price']}",
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
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
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

  Widget _buildBlog(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Blogs",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ); 
  }

  Widget _buildBlogList() {
    final blogs = [
      {
        'image': 'assets/images/blog1.jpg',
        'title': 'Skincare Tips for Healthy Skin',
        'name': 'Skincare',
      },
      {
        'image': 'assets/images/blog2.jpg',
        'title': 'Top 5 Fragrances for Spring',
        'name': 'Fragrance',
      },
      {
        'image': 'assets/images/blog3.jpg',
        'title': 'Hair Care Routine for All Hair Types',
        'name': 'Hair',
      },
      {
        'image': 'assets/images/blog4.jpg',
        'title': 'Eflacre: The Future of Skincare',
        'name': 'Eflacre',
      }
    ];
    
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: blogs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16.0,),
        itemBuilder: (context, index) {
          Map<String,dynamic> blog = blogs[index];
          return Container(
            width: 300,
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
                  child: Image.asset(
                    blog['image'],
                    width: 300,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    blog['name'],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    blog['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, 
                      fontSize: 18,
                    ),
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