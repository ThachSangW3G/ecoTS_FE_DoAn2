import 'package:ecots_fe/controllers/location_controller.dart';
import 'package:ecots_fe/controllers/reward_controller.dart';
import 'package:ecots_fe/models/rewards/reward.dart';
import 'package:ecots_fe/screens/deliveries/delivery_detail_screen.dart';
import 'package:ecots_fe/screens/rewards/reward_successfully.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_style.dart';
import '../../controllers/user_controller.dart';

class DeliveryScreen extends StatefulWidget {
  final Reward reward;
  const DeliveryScreen({super.key, required this.reward});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final LocationController _locationController = Get.put(LocationController());
  final UserController _userController = Get.put(UserController());
  final RewardController _rewardController = Get.put(RewardController());

  String? _selectedLocation; // Lưu vị trí được chọn
  final List<String> _locations = ['Location 1', 'Location 2', 'Location 3'];

  bool _isLoading = false;

  Future<void> _updateReward() async {
    if (_selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a location'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final success = await _rewardController.updateRewardHistory(
        _userController.currentUser.value!.id,
        widget.reward.pointCharge,
        widget.reward.id,
        1,
        _selectedLocation!);

    if (success) {
      Get.to(() => const RewardSuccessfully());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Not enough points to redeem gifts.'),
      ));
    }

    setState(() {
      _isLoading = false;
    });
  }

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
            const Text(
              "Choose location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // DropdownButton
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedLocation,
                hint: const Text(
                  "Placeholder",
                  style: TextStyle(color: Colors.grey),
                ),
                isExpanded: true,
                underline: const SizedBox(),
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

            const SizedBox(
              height: 20,
            ),

            const Text(
              "The package has been order",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "The package has been well received",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
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
            const Spacer(),
            // Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  _updateReward();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
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
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
