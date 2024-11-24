import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import './hot_deal.dart';
import './category_page.dart';
=======
import 'package:flutter_dealpick/home_screen/components/hot_deal.dart';
import 'package:flutter_dealpick/home_screen/components/category_page.dart';
import 'package:google_fonts/google_fonts.dart';
=======
import 'package:google_fonts/google_fonts.dart';
import './hot_deal.dart';
import './category_page.dart';
>>>>>>> b0e9d45 (카테고리 선택 기능 추가)
>>>>>>> 4287929 (카테고리 선택 기능 추가)

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
=======
>>>>>>> a0c0869 (feat: CategoryPage 연결)
import 'package:flutter_dealpick/home_screen/components/hot_deal.dart';
import 'package:flutter_dealpick/home_screen/components/category_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
<<<<<<< HEAD
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
=======
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  @override
>>>>>>> a0c0869 (feat: CategoryPage 연결)
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
<<<<<<< HEAD
<<<<<<< HEAD
        backgroundColor: const Color(0xff34BD8C),
        shape: const CircleBorder(),
        child: const Icon(
=======
        backgroundColor: Color(0xff34BD8C),
        shape: CircleBorder(),
        child: Icon(
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
=======
        backgroundColor: const Color(0xff34BD8C),
        shape: const CircleBorder(),
        child: const Icon(
>>>>>>> a0c0869 (feat: CategoryPage 연결)
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
<<<<<<< HEAD
              color: const Color(0xffD9D9D9),
=======
              color: Color(0xffD9D9D9),
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
=======
              color: const Color(0xffD9D9D9),
>>>>>>> a0c0869 (feat: CategoryPage 연결)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
<<<<<<< HEAD
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
=======
                _categoryButton(0, '대형세단'),
                _categoryButton(1, 'SUV'),
                _categoryButton(2, '경차'),
              ],
            ),
          ),
          CategoryPage(selectedCategory: selectedCategory),
>>>>>>> a0c0869 (feat: CategoryPage 연결)
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
<<<<<<< HEAD
              color: const Color(0xff34BD8C),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
=======
              color: Color(0xff34BD8C),
=======
              color: const Color(0xff34BD8C),
>>>>>>> a0c0869 (feat: CategoryPage 연결)
            ),
          ),
          const Spacer(),
          IconButton(
<<<<<<< HEAD
            icon: Icon(
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
=======
            icon: const Icon(
>>>>>>> a0c0869 (feat: CategoryPage 연결)
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
<<<<<<< HEAD
<<<<<<< HEAD
            icon: const Icon(
=======
            icon: Icon(
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
=======
            icon: const Icon(
>>>>>>> a0c0869 (feat: CategoryPage 연결)
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
<<<<<<< HEAD
=======
>>>>>>> a0c0869 (feat: CategoryPage 연결)

  Widget _categoryButton(int index, String categoryName) {
    return GestureDetector(
      onTap: () {
        setState(() {
<<<<<<< HEAD
<<<<<<< HEAD
          selectedCategory = index;
=======
          selectedCategory = index; // 클릭한 카테고리로 변경
>>>>>>> a0c0869 (feat: CategoryPage 연결)
=======
          selectedCategory = index;
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)
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
<<<<<<< HEAD
<<<<<<< HEAD
            fontWeight:
                selectedCategory == index ? FontWeight.bold : FontWeight.normal,
=======
            fontWeight: FontWeight.bold,
>>>>>>> a0c0869 (feat: CategoryPage 연결)
=======
            fontWeight:
                selectedCategory == index ? FontWeight.bold : FontWeight.normal,
>>>>>>> 2240143 (feat: Splash/HomeScreen & 폴더구조 생성)
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
=======
>>>>>>> c48b7ba (feat: 오늘의 핫딜 섹션 완성)
=======
>>>>>>> a0c0869 (feat: CategoryPage 연결)
}
