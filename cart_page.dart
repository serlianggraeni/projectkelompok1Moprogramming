import 'package:flutter/material.dart';
import 'package:penjualantokosendal/pages/product_detail_page.dart';
import 'package:penjualantokosendal/pages/checkout_page.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Product Sandal Warna Warni',
      'price': 45,
      'qty': 1,
      'image': 'assets/img/sandal1.png',
    },
    {
      'title': 'Product Sandal Pria ',
      'price': 55,
      'qty': 1,
      'image': 'assets/img/sandal2.png',
    },
    {
      'title': 'Product Sandal Anak-Anak',
      'price': 55,
      'qty': 1,
      'image': 'assets/img/sandal3.png',
    },
  ];

  void increaseQty(int index) {
    setState(() {
      cartItems[index]['qty']++;
    });
  }

  void decreaseQty(int index) {
    setState(() {
      if (cartItems[index]['qty'] > 1) {
        cartItems[index]['qty']--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double calculateTotal() {
    return cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['qty']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        elevation: 0,
        title: Text('Keranjang Belanja', style: TextStyle(color: Colors.deepPurple)),
        leading: BackButton(color: Colors.deepPurple),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.deepPurple),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: true,
                        onChanged: (_) {},
                      ),
                      Image.asset(
                        item['image'],
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple)),
                            SizedBox(height: 5),
                            Text("\$${item['price']}",
                                style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => increaseQty(index),
                            icon: Icon(Icons.add_circle_outline),
                          ),
                          Text(
                            item['qty'].toString().padLeft(2, '0'),
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () => decreaseQty(index),
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeItem(index),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.add_circle, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text("Add Coupon Code",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text("\$${calculateTotal().toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      cartItems: cartItems,
                        total: calculateTotal(),
                    ),
                  ),
                );
              },
              child: Text("Check Out", style: TextStyle(fontSize: 16, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
