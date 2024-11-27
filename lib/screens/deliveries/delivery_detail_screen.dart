import 'package:flutter/material.dart';

import '../../constants/app_style.dart';

class DeliveryDetailScreen extends StatefulWidget {
  const DeliveryDetailScreen({super.key});

  @override
  State<DeliveryDetailScreen> createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
  final List<Map<String, String>> trackingData = [
    {
      "status": "Order Placed",
      "date": "June 25, 2024",
    },
    {
      "status": "Package Picked Up",
      "date": "June 25, 2024 | New York, NY",
    },
    {
      "status": "In Transit",
      "date": "June 25, 2024 | Newark, NJ",
    },
    {
      "status": "Arrived at Hub",
      "date": "June 28, 2024 | Philadelphia, PA",
    },
    {
      "status": "Departed Hub",
      "date": "June 29, 2024 | Philadelphia, PA",
    },
    {
      "status": "Out for Delivery",
      "date": "July 30, 2024 | Los Angeles, CA",
    },
  ];

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
            // Title and Subtitle
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
                _buildInfoCard(Icons.local_shipping, "2.4 kg", "Package Weight"),
              ],
            ),
            SizedBox(height: 24),
            // Timeline Section
            Expanded(
              child: ListView.builder(
                itemCount: trackingData.length,
                itemBuilder: (context, index) {
                  return _buildTimelineItem(
                    trackingData[index]["status"]!,
                    trackingData[index]["date"]!,
                    isLast: index == trackingData.length - 1,
                  );
                },
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


  Widget _buildTimelineItem(String status, String date, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Circle and Line
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 50,
                color: Colors.grey,
              ),
          ],
        ),
        SizedBox(width: 12),
        // Text Information
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
