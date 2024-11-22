import 'package:flutter/material.dart';
import 'package:flutter_dealpick/home_screen/components/category_view.dart';
import 'package:flutter_dealpick/home_screen/components/hot_deal.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff34BD8C),
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Color(0xffffffff),
        ),
      ),
      body: ListView(
        children: [
          HotDeal(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              thickness: 5,
              color: Color(0xffD9D9D9),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CategoryView(category: '대형세단'),
                CategoryView(category: 'SUV'),
                CategoryView(category: '경차'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        children: [
          Text(
            'DealPick',
            style: GoogleFonts.lobster(
              fontSize: 32,
              fontWeight: FontWeight.normal,
              color: Color(0xff34BD8C),
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
