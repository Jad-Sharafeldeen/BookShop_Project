import 'package:flutter/material.dart';
import 'products.dart';
import 'contact_us.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ghandi's Bookshop"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: buildCategoryCard(
                    imageUrl: 'https://images.unsplash.com/photo-1558365916-848463c5d803?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    title: 'Products',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductsPage()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: buildCategoryCard(
                    imageUrl: 'https://media.istockphoto.com/id/960462152/photo/bussiness-man-hand-press-button-on-panel-of-printer-printer-scanner-laser-office-copy-machine.jpg?s=1024x1024&w=is&k=20&c=QCVNGmMQ897U0bdHgYaTGLOl4fr1KDnbtJdG7MrQDwM=',
                    title: 'Services',
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: buildCategoryCard(
                    imageUrl: 'https://media.istockphoto.com/id/1251133771/photo/hand-using-mobile-smart-phone-scan-qr-code-on-blue-background-cashless-technology-and-digital.jpg?s=1024x1024&w=is&k=20&c=kQbSOyUA4fk6k6lUalmR9gXFQV4IMBytoxaadRWPBcE=',
                    title: 'Price Scanner',
                    onPressed: () {

                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: buildCategoryCard(
                    imageUrl: 'https://images.unsplash.com/photo-1596524430615-b46475ddff6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    title: 'Contact Us',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUsPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard({
    required String imageUrl,
    required String title,
    required VoidCallback onPressed,
  }) {
    return Card(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 250, // adjust the height as needed
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
