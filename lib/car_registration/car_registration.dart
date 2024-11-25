import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'category_selection_page.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:intl/intl.dart';
import 'dart:convert';
=======
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
import 'package:intl/intl.dart';
import 'dart:convert';
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)

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
<<<<<<< HEAD
<<<<<<< HEAD
=======
  int _imageCount = 0;
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)

  @override
  void dispose() {
    _sellerController.dispose();
    _categoryController.dispose();
    _productNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
  void _handleImageSelection() {
    // TODO: 이미지 선택 로직 구현
    setState(() {
      if (_imageCount < 5) {
        _imageCount++;
      }
    });
  }

>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
<<<<<<< HEAD
<<<<<<< HEAD
=======
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
            
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
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
<<<<<<< HEAD
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
                },
                child: const Text('확인'),
              ),
            ],
          );
        },
=======
      // CSV 데이터 생성
      final csvData = [
        ['판매자', '카테고리', '제품명', '연료', '가격', '설명'],
        [
          _sellerController.text,
          _categoryController.text,
          _productNameController.text,
          _selectedFuel,
          _priceController.text.replaceAll(',', ''),
          _descriptionController.text
        ]
      ].map((row) => row.join(',')).join('\n');

      // 앱 문서 디렉토리 가져오기
      final directory = await getApplicationDocumentsDirectory();
      final customerDirectory = Directory('${directory.path}/customer');

      // customer 폴더가 없으면 생성
      if (!await customerDirectory.exists()) {
        await customerDirectory.create(recursive: true);
      }

      // CSV 파일 저장
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${customerDirectory.path}/product_registration_$timestamp.csv');
      await file.writeAsString(csvData);

<<<<<<< HEAD
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('데이터가 저장되었습니다: ${file.path}')),
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
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
                },
                child: const Text('확인'),
              ),
            ],
          );
        },
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
      );

      // 폼 초기화
      _sellerController.clear();
      _categoryController.clear();
      _productNameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedFuel = null;
<<<<<<< HEAD
<<<<<<< HEAD
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('저장 중 오류가 발생했습니다: $e')),
        );
      }
=======
        _imageCount = 0;
      });

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('저장 중 오류가 발생했습니다: $e')),
      );
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
      });

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('저장 중 오류가 발생했습니다: $e')),
        );
      }
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
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

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
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

<<<<<<< HEAD
=======
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
            : label == '판매 가격'
                ? TextField(
                    controller: getController(),
                    maxLines: maxLines,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      getFormatter()!,
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      suffixText: '원',
                      suffixStyle: const TextStyle(fontSize: 16),
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
                    ),
<<<<<<< HEAD
                  ),
=======
            : TextField(
                controller: getController(),
                maxLines: maxLines,
                keyboardType: label == '판매 가격' ? TextInputType.number : TextInputType.text,
                inputFormatters: label == '판매 가격' 
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
>>>>>>> 4287929 (카테고리 선택 기능 추가)
=======
                  ),
>>>>>>> 4682b2d (사진삭제|  등록하기 버튼 활성화)
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