import 'dart:io';

import 'package:ecots_fe/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controllers/newsfeed_controller.dart';

class CreateFeeedScreen extends StatefulWidget {
  const CreateFeeedScreen({super.key});

  @override
  State<CreateFeeedScreen> createState() => _CreateFeedScreenState();
}

class _CreateFeedScreenState extends State<CreateFeeedScreen> {
  final NewsfeedController _newsfeedController = Get.put(NewsfeedController());
  final UserController _userController = Get.find();

  bool isPublic = true; // Default to Public

  List<String> _selectedImages = []; // Lưu đường dẫn các ảnh đã chọn

  DateTime _seleteStartedDate = DateTime.now();
  DateTime _selectEndedDate = DateTime.now();
  List<TextEditingController> _pollOptionControllers = [];

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  bool _isLoading = false;

  Future<void> _pickMultipleImages() async {
    try {
      final result = await picker.pickMultiImage();

      if (result != null) {
        setState(() {
          _selectedImages = result.map((file) => file.path).toList();
        });
      }
    } catch (e) {
      print("Lỗi khi chọn ảnh: $e");
    }
  }

  void _addOption() {
    setState(() {
      _pollOptionControllers.add(TextEditingController());
    });
  }

  void _removeOption(int index) {
    setState(() {
      _pollOptionControllers[index].dispose(); // Giải phóng controller
      _pollOptionControllers.removeAt(index);
    });
  }

  bool validateForm() {
    for (var controller in _pollOptionControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }

    if (_selectedImages.isEmpty ||
        _aboutController.text.isEmpty ||
        _startDateController.text.isEmpty ||
        _endDateController.text.isEmpty) {
      return false;
    }

    return true;
  }

  void _submitForm() {
    if (validateForm()) {
      _createNewsfeed();
    } else {
      // Hien thong bao loi
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all required fields.")));
    }
  }

  void _createNewsfeed() async {
    setState(() {
      _isLoading = true;
    });
    final success = await _newsfeedController.createNewsfeed(
      content: _aboutController.text,
      userId: _userController.currentUser.value!.id,
      pollOptions:
          _pollOptionControllers.map((controller) => controller.text).toList(),
      startedAt: _seleteStartedDate,
      endedAt: _selectEndedDate,
      files: _selectedImages.map((imagePath) => File(imagePath)).toList(),
    );

    setState(() {
      _isLoading = false;
    });
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Create newsfeed successfully")));
      Get.back();
    }
  }

  Future<void> _pickDate(BuildContext context, bool isStartedDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày mặc định ban đầu
      firstDate: DateTime(2000), // Giới hạn ngày nhỏ nhất
      lastDate: DateTime(2100), // Giới hạn ngày lớn nhất
    );

    if (isStartedDate) {
      if (pickedDate != null && pickedDate != _seleteStartedDate) {
        setState(() {
          _seleteStartedDate = pickedDate;
          _startDateController.text =
              DateFormat('yyyy-MM-dd').format(pickedDate);
        });
      }
    } else {
      if (pickedDate != null && pickedDate != _selectEndedDate) {
        setState(() {
          _selectEndedDate = pickedDate;
          _endDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create new feed",
          style: kLableTextBlackW600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upload Image
              _selectedImages.isEmpty
                  ? InkWell(
                      onTap: _pickMultipleImages,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.upload_file,
                              size: 24,
                              color: AppColors.green,
                            ),
                            label: Text(
                              "Upload image",
                              style: kLableTextStyleTilteGreen,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            _selectedImages.length + 1, // Thêm 1 cho nút "+"
                        itemBuilder: (context, index) {
                          if (index == _selectedImages.length) {
                            // Nút "+" để chọn thêm ảnh
                            return GestureDetector(
                              onTap: _pickMultipleImages,
                              child: Container(
                                width: 100,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          }

                          // Hiển thị ảnh
                          return Stack(
                            children: [
                              Container(
                                width: 150,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        FileImage(File(_selectedImages[index])),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              // Nút "x" để xóa ảnh
                              Positioned(
                                top: 0,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedImages.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
              const SizedBox(height: 24),

              // About
              Row(
                children: [
                  Text(
                    "About",
                    style: kLableTextStyleMiniumBlack,
                  ),
                  const Gap(3),
                  Text('*', style: kLableTextStyleMiniumRed),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _aboutController,
                maxLength: 180,
                maxLines: 3,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter description",
                  hintStyle: kLableTextGreyItalic,
                ),
              ),
              const SizedBox(height: 16),

              // Start date
              Row(
                children: [
                  Text(
                    "Started date",
                    style: kLableTextStyleMiniumBlack,
                  ),
                  const Gap(3),
                  Text('*', style: kLableTextStyleMiniumRed),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _startDateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "yyyy-MM-dd",
                  hintStyle: kLableTextGreyItalic,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      _pickDate(context, true);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Start date
              Row(
                children: [
                  Text(
                    "Ended date",
                    style: kLableTextStyleMiniumBlack,
                  ),
                  const Gap(3),
                  Text('*', style: kLableTextStyleMiniumRed),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _endDateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "yyyy-MM-dd",
                  hintStyle: kLableTextGreyItalic,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      _pickDate(context, false);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              //Poll Options

              Row(
                children: [
                  Text(
                    "Poll Options",
                    style: kLableTextStyleMiniumBlack,
                  ),
                  const Gap(3),
                  Text('*', style: kLableTextStyleMiniumRed),
                ],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _pollOptionControllers.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: _pollOptionControllers[index],
                          decoration: InputDecoration(
                            hintText: "Option ${index + 1}",
                            border: const OutlineInputBorder(),
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              if (_pollOptionControllers.length > 1) {
                                _removeOption(index);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "At least one option is required")));
                              }
                            },
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.anwserRed,
                            ))
                      ],
                    ),
                  );
                },
              ),

              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                        onPressed: _addOption,
                        icon: const Icon(Icons.add),
                        label: const Text("Add option")),
                  ),
                ],
              ),
              // Category

              // Create Community Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                  ),
                  onPressed: () {
                    _submitForm();
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.white,
                        )
                      : Text(
                          "Create newsfeed",
                          style: kLableTextBlackW600Size15,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: CreateFeeedScreen(),
    ));
