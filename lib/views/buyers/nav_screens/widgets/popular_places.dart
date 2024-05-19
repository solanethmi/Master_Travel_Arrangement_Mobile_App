import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_travel/views/buyers/nav_screens/widgets/text_widget.dart';

class PopularPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('city').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var places = snapshot.data!.docs;

        return Container(
          decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/b-log.jpg",),
        fit: BoxFit.cover,
        opacity: 0.9,
        
        ),
        
      ),
          child: Column(
            children: List.generate(
              places.length,
              (index) {
                var place = places[index].data() as Map<String, dynamic>;
                var image = place['image'] as String?;
                var weatherConditions = place['weatherConditions'] as String?;
                var cityName = place['cityName'] as String?;
                var distanceFromColombo =
                    place['distanceFromColombo'] as num?;
        
                return Material(
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      // Handle tap event if needed
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side: Image
                          Image.network(
                            image ?? '',
                            height: 130,
                            width: 130,
                            fit: BoxFit.fill,
                          ),
                          // Right side: Details
                          SizedBox(width: 30), // Space between image and details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: cityName ?? '',
                                textSize: 18,
                                isTitle: true,
                              ),
                              TextWidget(
                                text: weatherConditions ?? '',
                                textSize: 16,
                              ),
                              TextWidget(
                                text: 'Distance: ${distanceFromColombo ?? 0} km',
                                textSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
