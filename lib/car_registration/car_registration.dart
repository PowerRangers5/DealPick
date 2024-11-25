import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'category_selection_page.dart';
import 'package:intl/intl.dart';

class ProductRegistrationForm extends StatefulWidget {
  const ProductRegistrationForm({super.key});

  @override
  State<ProductRegistrationForm> createState() => _ProductRegistrationFormState();
}

class _ProductRegistrationFormState extends State<ProductRegistrationForm> {
  // 폼 컨트롤러들
  final TextEditingController _sellerController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedFuel;
  int _imageCount = 0; // 이미지 카운트 추가

  @override
  void dispose() {
    _sellerController.dispose();
    _categoryController.dispose();
    _productNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleImageSelection() {
    // TODO: 이미지 선택 로직 구현
    setState(() {
      if (_imageCount < 5) {
        _imageCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 이미지 선택 영역
            GestureDetector(
              onTap: _handleImageSelection,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt, 
                      color: Colors.grey,
                      size: 80,
                    ),
                    Text('$_imageCount/5', 
                      style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
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
        _imageCount = 0; // 이미지 카운트 초기화
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
                keyboardType: label == '판매 가격' ? TextInputType.number : TextInputType.text,
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