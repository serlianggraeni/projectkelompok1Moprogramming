import 'package:flutter/material.dart';
import 'package:penjualantokosendal/pages/cart_page.dart';
import 'package:penjualantokosendal/pages/login_page.dart';
import 'package:penjualantokosendal/pages/product_detail_page.dart';
import 'package:penjualantokosendal/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'icon': '👠', 'label': 'Heels'},
    {'icon': '👡', 'label': 'Wedges'},
    {'icon': '👟', 'label': 'Slip On'},
  ];

  final List<Map<String, String>> products = [
    {
      'image': 'assets/img/sandal1.png',
      'title': 'Flip Flop',
      'desc':
          'Sandal ini sudah dilengkapi dengan anti slip, ringan digunakan, dan juga terasa lembut. Alhasil, tidak membuat kaki Anda sakit selama menggunakan sandal jepit tersebut.',
      'price': '45',
    },
    {
      'image': 'assets/img/sandal2.png',
      'title': 'Sandal Garis',
      'desc': 'sandal dijual hitam putih diskon 50% pun ga laku',
      'price': '55',
    },
    {
      'image': 'assets/img/sandal3.png',
      'title': 'Wedges',
      'desc':
          ' jenis sepatu yang memiliki sol tebal di bagian tumit dan menipis di bagian depannya, menciptakan efek “wedge” atau segitiga. Mereka memberikan ketinggian tambahan tanpa mengorbankan kenyamanan yang dimiliki sepatu datar.',
      'price': '55',
    },
    {
      'image': 'assets/img/sandal4.png',
      'title': 'Sandal Terompah',
      'desc':
          'Sandal terompah ini terbuat dari kayu sebagai bahan utama, terompah tidak hanya berfungsi sebagai alas kaki, tetapi juga mencerminkan kearifan lokal dan budaya masyarakat tempo dulu.',
      'price': '55',
    },

    {
      'image': 'assets/img/sandal5.png',
      'title': 'Sandal Pria Casual',
      'desc':
          'Sandal slip on pria ini umumnya terbuat dari bahan kulit yang memberikan kesan elegan dan mewah, serta tahan lama jika dirawat dengan baik.',
      'price': '55',
    },

    {
      'image': 'assets/img/sandal6.png',
      'title': 'Sandal Slip On Pria ',
      'desc':
          'Sandal slip on pria ini umumnya terbuat dari bahan kulit yang memberikan kesan elegan dan mewah, serta tahan lama jika dirawat dengan baik',
      'price': '55',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.deepPurple
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          tooltip: 'Menu',
        ),
        title: Text(
          'Beranda Sandal',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.deepPurple,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                tooltip: 'Keranjang Belanja',
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCategoryList(),
            SizedBox(height: 20),
            Text(
              'Best Selling',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildProductGrid(products),
            SizedBox(height: 70),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search here...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.camera_alt_outlined),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          categories.map((cat) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(cat['icon'] ?? '', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 6),
                  Text(
                    cat['label'] ?? '',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget _buildProductGrid(List<Map<String, String>> products) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 260,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        var p = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(child: Image.asset(p['image']!, height: 100)),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '-50%',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.favorite_border, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  p['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(p['desc']!, style: TextStyle(fontSize: 12)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${p['price']}',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home, color: Colors.white),
            tooltip: 'Beranda',
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            tooltip: 'Keranjang',
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.person, color: Colors.white),
            tooltip: 'Profil',
          ),
        ],
      ),
    );
  }
}
