import 'package:flutter/material.dart';
import 'pens.dart';

class ProductsPage extends StatelessWidget {
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
                    imageUrl: 'https://images.unsplash.com/photo-1605641987825-c1664626d79f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    title: 'Pens',
                    onPressed: () {
                      // Navigate to Products page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PensPage()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: buildCategoryCard(
                    imageUrl: 'https://media.istockphoto.com/id/1468773622/photo/side-view-of-a-thick-book-macro.jpg?s=2048x2048&w=is&k=20&c=19TbZrMCd4rp5sAFar9rnDGiarwYKiaAgvkRey-Mk80=',
                    title: 'Card Board',
                    onPressed: () {
                      // Navigate to services screen
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
                    imageUrl: 'https://images.unsplash.com/photo-1449668800654-c55ef9de3ef5?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    title: 'Painting Gear',
                    onPressed: () {
                      // Navigate to price scanner screen
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: buildCategoryCard(
                    imageUrl: 'https://media.istockphoto.com/id/820482470/photo/backpack.jpg?s=2048x2048&w=is&k=20&c=ed_FaxJCleaEeotPw92OqOfWLTHvhZ5M8Bq_FdKbBnc=',
                    title: 'Back Bags',
                    onPressed: () {
                      // Navigate to contact us screen
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
