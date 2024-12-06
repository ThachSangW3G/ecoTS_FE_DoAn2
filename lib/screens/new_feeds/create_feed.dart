import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class CreateFeeedScreen extends StatefulWidget {
  @override
  _CreateFeedScreenState createState() => _CreateFeedScreenState();
}

class _CreateFeedScreenState extends State<CreateFeeedScreen> {
  bool isPublic = true; // Default to Public

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new feed", style: kLableTextBlackW600,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upload Image
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon:  Icon(Icons.upload_file, size: 24, color: AppColors.green,),
                    label:  Text("Upload image", style: kLableTextStyleTilteGreen,),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Community Name
               Text(
                "Community name*",
                style: kLableTextStyleMiniumBlack,
              ),
              const SizedBox(height: 8),
              TextField(
                maxLength: 30,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name your community",
                  hintStyle: kLableTextGreyItalic,
                ),
              ),
              const SizedBox(height: 16),

              // About
               Text(
                "About",
                style: kLableTextStyleMiniumBlack,
              ),
              const SizedBox(height: 8),
              TextField(
                maxLength: 180,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter description",
                  hintStyle: kLableTextGreyItalic,
                ),
              ),
              const SizedBox(height: 16),

              // Category
               Text(
                "Category*",
                style: kLableTextStyleMiniumBlack,
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  // Open category selection
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Select category", style: TextStyle(color: Colors.grey)),
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Privacy Options
               Text(
                "Privacy",
                style: kLableTextStyleMiniumBlack,
              ),
              const SizedBox(height: 8),
              RadioListTile<bool>(
                value: true,
                groupValue: isPublic,
                onChanged: (value) => setState(() => isPublic = value!),
                title: const Text("Public"),
                subtitle:  Text(
                  "Anyone can join, view, and search the posts in this community.",
                  style: kLableTextBlackW600Size13,
                ),
              ),
              RadioListTile<bool>(
                value: false,
                groupValue: isPublic,
                onChanged: (value) => setState(() => isPublic = value!),
                title: const Text("Private"),
                subtitle:  Text(
                  "Only members invited by the moderators can join, view, and search the posts in this community.",
                  style: kLableTextBlackW600Size13,
                ),
              ),
              const SizedBox(height: 24),

              // Create Community Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                  ),
                  onPressed: () {
                    // Handle create community logic
                  },
                  child:  Text("+ Create community", style: kLableTextBlackW600Size15,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: CreateFeeedScreen(),
));
