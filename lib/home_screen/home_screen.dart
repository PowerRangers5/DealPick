import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import './hot_deal.dart';
import './category_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  @override
=======
import 'package:flutter_dealpick/home_screen/components/category_view.dart';
import 'package:flutter_dealpick/home_screen/components/hot_deal.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
<<<<<<< HEAD
        backgroundColor: const Color(0xff34BD8C),
        shape: const CircleBorder(),
        child: const Icon(
=======
        backgroundColor: Color(0xff34BD8C),
        shape: CircleBorder(),
        child: Icon(
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
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
<<<<<<< HEAD
              color: const Color(0xffD9D9D9),
=======
              color: Color(0xffD9D9D9),
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
<<<<<<< HEAD
                _categoryButton(0, '대형세단'),
                _categoryButton(1, 'SUV'),
                _categoryButton(2, '경차'),
              ],
            ),
          ),
          CategoryPage(selectedCategory: selectedCategory),
=======
                CategoryView(category: '대형세단'),
                CategoryView(category: 'SUV'),
                CategoryView(category: '경차'),
              ],
            ),
          ),
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
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
<<<<<<< HEAD
              color: const Color(0xff34BD8C),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
=======
              color: Color(0xff34BD8C),
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
<<<<<<< HEAD
            icon: const Icon(
=======
            icon: Icon(
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
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
<<<<<<< HEAD

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
=======
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
}
