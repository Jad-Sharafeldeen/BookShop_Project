import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Pen {
  String name;
  double price;
  String imageUrl;

  Pen(this.name, this.price, this.imageUrl);

  @override
  String toString() {
    return 'Name: $name\nPrice: \$${price.toStringAsFixed(2)}\nImage URL: $imageUrl';
  }
}

class PensPage extends StatefulWidget {
  @override
  _PensPageState createState() => _PensPageState();
}

class _PensPageState extends State<PensPage> {
  List<Pen> pens = [];

  @override
  void initState() {
    super.initState();
    fetchPens();
  }

  Future<void> fetchPens() async {
    try {
      final url = Uri.https('ghandisbookshop.000webhostapp.com', 'getPens.php');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        for (var penData in jsonResponse) {
          Pen pen = Pen(
            penData['product_name'],
            double.parse(penData['price']),
            penData['image_url'],
          );
          pens.add(pen);
        }
        setState(() {});
      } else {
        print('Failed to load pens');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pens'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Display two pens in each row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: pens.length,
        itemBuilder: (context, index) {
          return buildPenCard(pens[index]);
        },
      ),
    );
  }

  Widget buildPenCard(Pen pen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PenDetailPage(pen: pen),
          ),
        );
      },
      child: Hero(
        tag: pen.imageUrl,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  pen.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pen.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('\$${pen.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              /*ElevatedButton(onPressed: (){

              }, child: Text('Add to Cart')),*/
            ],
          ),
        ),

      ),
    );
  }
}

class PenDetailPage extends StatelessWidget {
  final Pen pen;

  PenDetailPage({required this.pen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: pen.imageUrl,
            child: Image.network(
              pen.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
