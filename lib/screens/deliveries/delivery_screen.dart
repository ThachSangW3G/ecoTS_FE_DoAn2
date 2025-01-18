import 'package:ecots_fe/controllers/location_controller.dart';
import 'package:ecots_fe/screens/deliveries/delivery_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_style.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final LocationController _locationController = Get.put(LocationController());

  String? _selectedLocation; // Lưu vị trí được chọn
  final List<String> _locations = ['Location 1', 'Location 2', 'Location 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text label
            Text(
              "Choose location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // DropdownButton
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedLocation,
                hint: Text(
                  "Placeholder",
                  style: TextStyle(color: Colors.grey),
                ),
                isExpanded: true,
                underline: SizedBox(),
                items: _locationController.locationList.value!.map((location) {
                  return DropdownMenuItem(
                    value: location.id.toString(),
                    child: Text(location.locationName),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                  });
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              "The package has been order",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The package has been well received",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            // Track Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard(Icons.receipt, "FLX23874926", "Track ID"),
                _buildInfoCard(Icons.schedule, "3–5 days", "Estimate Time"),
                _buildInfoCard(
                    Icons.local_shipping, "2.4 kg", "Package Weight"),
              ],
            ),
            Spacer(),
            // Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => DeliveryDetailScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: 36),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
