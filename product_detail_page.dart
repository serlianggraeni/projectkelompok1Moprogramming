import 'package:flutter/material.dart';
import 'package:penjualantokosendal/pages/cart_page.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int qty = 1;
  int selectedSize = 7;
  Color selectedColor = Colors.red;
  bool isFavorite = false;

  void incrementQty() => setState(() => qty++);
  void decrementQty() => setState(() => qty > 1 ? qty-- : qty);
  void toggleFavorite() => setState(() => isFavorite = !isFavorite);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        elevation: 0,
        title: Text('Product Sandal', style: TextStyle(color: Colors.deepPurple)),
        leading: BackButton(color: Colors.deepPurple),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: toggleFavorite,
          )
        ],
      ),
      body: Column(  
        children: [
          Image.asset(
            'assets/img/sandal1.png',
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 6),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: ListView(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.favorite,
                        color: index < 4 ? Colors.deepPurple : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Product Sandal Flip Flop",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepPurple)),
                      Row(
                        children: [
                          IconButton(
                              onPressed: decrementQty,
                              icon: Icon(Icons.remove_circle_outline)),
                          Text(qty.toString().padLeft(2, '0')),
                          IconButton(
                              onPressed: incrementQty,
                              icon: Icon(Icons.add_circle_outline)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This is more detailed description of the product. You can write here more about the product. This is lengthy description.",
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text("Size:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple)),
                  Row(
                    children: [5, 6, 7, 8, 9].map((size) {
                      bool selected = selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = size),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                selected ? Colors.deepPurple : Colors.grey[300],
                          ),
                          child: Text(
                            size.toString(),
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text("Color:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple)),
                  Row(
                    children: [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.orange,
                      Colors.purple
                    ].map((color) {
                      return GestureDetector(
                        onTap: () => setState(() => selectedColor = color),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: selectedColor == color
                                ? Border.all(
                                    width: 2, color: Colors.deepPurple)
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$120",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple)),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()),
                    ); 
                  },
                  icon: Icon(Icons.shopping_cart_checkout,
                  color: Colors.white),
                  label: Text("Add To Cart",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
