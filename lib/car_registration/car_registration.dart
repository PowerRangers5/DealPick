import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dealpick/db_list.dart';
import 'category_selection_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dealpick/db_list.dart';

class ProductRegistrationForm extends StatefulWidget {
  const ProductRegistrationForm({super.key});

  @override
  State<ProductRegistrationForm> createState() =>
      _ProductRegistrationFormState();
}

class CarRegistration extends StatelessWidget {
  const CarRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('차량 등록'), // 앱바 제목
      ),
      body: const ProductRegistrationForm(), // 차량 등록 폼을 표시
    );
  }
}

class _ProductRegistrationFormState extends State<ProductRegistrationForm> {
  // 폼 컨트롤러들
  final TextEditingController _sellerController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedFuel;

  @override
  void dispose() {
    _sellerController.dispose();
    _categoryController.dispose();
    _productNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 상품 정보 입력 필드들
            _buildTextField('판매자'),
            _buildTextField('카테고리'),
            _buildTextField('제품명'),
            _buildDropdownField('연료'),
            _buildTextField('판매 가격'),
            _buildTextField('상품설명', maxLines: 5),

            const SizedBox(height: 16),

            // 등록하기 버튼
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF34BD8C),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '등록하기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() async {
    // 폼 데이터 검증
    if (_sellerController.text.isEmpty ||
        _categoryController.text.isEmpty ||
        _productNameController.text.isEmpty ||
        _selectedFuel == null ||
        _priceController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필드를 입력해주세요.')),
      );
      return;
    }

  try {
    // 차량 정보를 리스트로 생성
    List<String> newCarEntry = [
      _sellerController.text, // 판매자
      _categoryController.text, // 카테고리
      _productNameController.text, // 제품명
      _selectedFuel!, // 연료
      _priceController.text.toString(), // 판매 가격
      _descriptionController.text // 상품설명
    ];

    // 카테고리에 따라 적절한 맵에 추가
    switch (_categoryController.text) {
      case '경차':
        db_light[db_light.length] = newCarEntry; // 경차 카테고리에 추가
        break;
      case '소형차':
        db_small[db_small.length] = newCarEntry; // 소형차 카테고리에 추가
        break;
      case '중형 세단':
        db_large[db_middle.length] = newCarEntry; // 대형차 카테고리에 추가
        break;
      case '대형 세단':
        db_large[db_large.length] = newCarEntry; // 대형차 카테고리에 추가
        break;
      case '소형 SUV':
        db_large[db_small_suv.length] = newCarEntry; // 대형차 카테고리에 추가
        break;
      case '중형 SUV':
        db_large[db_middle_suv.length] = newCarEntry; // 대형차 카테고리에 추가
        break;
      case '대형 SUV':
        db_large[db_large_suv.length] = newCarEntry; // 대형차 카테고리에 추가
        break;
      case '스포츠카':
        db_large[db_sports_car.length] = newCarEntry; // 대형차 카테고리에 추가
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('유효하지 않은 카테고리입니다.')),
        );
        return;
    }

      // 등록 완료 팝업
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('등록 완료'),
            content: const Text('등록이 완료되었습니다!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 팝업 닫기
                  Navigator.of(context).pop(); // home_screen으로 돌아가기
                },
                child: const Text('확인'),
              ),
            ],
          );
        },
      );

      // 폼 초기화
      _sellerController.clear();
      _categoryController.clear();
      _productNameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedFuel = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('저장 중 오류가 발생했습니다: $e')),
      );
    }
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    TextEditingController getController() {
      switch (label) {
        case '판매자':
          return _sellerController;
        case '카테고리':
          return _categoryController;
        case '제품명':
          return _productNameController;
        case '판매 가격':
          return _priceController;
        case '상품설명':
          return _descriptionController;
        default:
          return TextEditingController();
      }
    }

    // 가격 입력 시 천단위 콤마 추가를 위한 포맷터
    TextInputFormatter? getFormatter() {
      if (label == '판매 가격') {
        return TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.isEmpty) {
            return newValue;
          }
          final onlyNumbers = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
          final number = int.parse(onlyNumbers);
          final result = NumberFormat('#,###').format(number);
          return TextEditingValue(
            text: result,
            selection: TextSelection.collapsed(offset: result.length),
          );
        });
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        label == '카테고리'
            ? GestureDetector(
                onTap: () async {
                  final selected = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategorySelectionPage(),
                    ),
                  );
                  if (selected != null) {
                    _categoryController.text = selected;
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: getController(),
                    maxLines: maxLines,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      suffixIcon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              )
            : TextField(
                controller: getController(),
                maxLines: maxLines,
                keyboardType: label == '판매 가격'
                    ? TextInputType.number
                    : TextInputType.text,
                inputFormatters: label == '판매 가격'
                    ? [FilteringTextInputFormatter.digitsOnly, getFormatter()!]
                    : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  suffixText: label == '판매 가격' ? '원' : null,
                  suffixStyle: const TextStyle(fontSize: 16),
                ),
              ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: _selectedFuel,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            hint: const Text('연료를 선택하세요'),
            items: const [
              DropdownMenuItem<String>(value: '휘발유', child: Text('휘발유')),
              DropdownMenuItem<String>(value: '경유', child: Text('경유')),
              DropdownMenuItem<String>(value: '전기', child: Text('전기')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedFuel = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
