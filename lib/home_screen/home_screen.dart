import 'package:flutter/material.dart';
import 'package:flutter_dealpick/home_screen/components/hot_deal.dart';
import 'package:flutter_dealpick/home_screen/components/category_page.dart';
import 'package:flutter_dealpick/car_registration/car_registration.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const CarRegistration()), // CarRegistration 페이지로 이동
          );
        },
        backgroundColor: const Color(0xff34BD8C),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Color(0xffffffff),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const HotDeal(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                thickness: 5,
                color: const Color(0xffD9D9D9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _categoryButton(0, '대형세단'),
                  _categoryButton(1, 'SUV'),
                  _categoryButton(2, '경차'),
                ],
              ),
            ),
            CategoryPage(selectedCategory: selectedCategory),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Text(
            'DealPick',
            style: GoogleFonts.lobster(
              fontSize: 32,
              fontWeight: FontWeight.normal,
              color: const Color(0xff34BD8C),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/ShoppingCart');
            },
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(int index, String categoryName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selectedCategory == index
              ? const Color(0xff34BD8C)
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          categoryName,
          style: TextStyle(
            color: selectedCategory == index ? Colors.white : Colors.black,
            fontWeight:
                selectedCategory == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
