import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back,',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            Text(
              'Olivia',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.black87,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Promotional Banner Section
              _buildPromotionalBanners(),
              const SizedBox(height: 20),
            
            // Categories Section
            _buildCategoriesSection(),
            const SizedBox(height: 20),
            
            // New Arrivals Section
            _buildNewArrivalsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionalBanners() {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return _buildPromotionalBanner(
                brand: 'Murad',
                title: 'Retinol Youth Renewal\nNight Cream',
                description: 'Retinol Tri-Active Technology: Helps fight the appearance of lines/deep wrinkles, even skin tone, and visibly boost radiance.',
                buttonText: '20% OFF | BUY NOW',
                gradientColors: const [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                icon: Icons.face_retouching_natural,
              );
            case 1:
              return _buildPromotionalBanner(
                brand: 'Murad',
                title: 'Retinol Night\nSerum',
                description: 'Advanced formula with encapsulated retinol for gentle yet effective skin renewal and texture improvement.',
                buttonText: '10% OFF | SHOP NOW',
                gradientColors: const [Color(0xFF8D6E63), Color(0xFFA1887F)],
                icon: Icons.auto_fix_high,
              );
            case 2:
              return _buildPromotionalBanner(
                brand: 'La Roche-Posay',
                title: 'Effaclar Duo+\nAcne Treatment',
                description: 'Dual-action formula that targets existing blemishes and helps prevent new ones from forming.',
                buttonText: '15% OFF | GET IT NOW',
                gradientColors: const [Color(0xFF1976D2), Color(0xFF42A5F5)],
                icon: Icons.healing,
              );
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget _buildPromotionalBanner({
    required String brand,
    required String title,
    required String description,
    required String buttonText,
    required List<Color> gradientColors,
    required IconData icon,
  }) {
    return Container(
      width: 280,
      height: 190,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Product image on the right
          Positioned(
            right: -20,
            top: -10,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brand,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              _buildCategoryChip('Fragrance'),
              const SizedBox(width: 12),
              _buildCategoryChip('Makeup'),
              const SizedBox(width: 12),
              _buildCategoryChip('Hair'),
              const SizedBox(width: 12),
              _buildCategoryChip('Skincare'),
              const SizedBox(width: 12),
              _buildCategoryChip('Tools'),
              const SizedBox(width: 12),
              _buildCategoryChip('Bath & Body'),
              const SizedBox(width: 12),
              _buildCategoryChip('Men'),
              const SizedBox(width: 12),
              _buildCategoryChip('Gifts'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

    Widget _buildNewArrivalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'New arrivals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              _buildProductCard(
                'The Ordinary Glycolic Acid 7% To...',
                '\$14.50 USD',
                'LIMITED EDITION',
                false,
                'assets/images/product1',
              ),
              const SizedBox(width: 16),
              _buildProductCard(
                'The Ordinary Glycolic Acid 7% To...',
                '\$14.50 USD',
                '',
                true,
                'assets/images/product2.jpeg',
              ),
              const SizedBox(width: 16),
              _buildProductCard(
                'Product Name',
                '\$19.99 USD',
                'LIMITED',
                false,
                'assets/images/product3.jpeg',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(String name, String price, String tag, bool isFavorited, String imagePath) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (tag.isNotEmpty)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
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
  }
}