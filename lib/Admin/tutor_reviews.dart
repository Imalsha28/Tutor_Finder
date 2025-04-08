import 'package:flutter/material.dart';
import 'package:project_1/Admin/coustom_drawer.dart';

class TutorReviews extends StatefulWidget {
  const TutorReviews({super.key});

  @override
  State<TutorReviews> createState() => _TutorReviewsState();
}

class _TutorReviewsState extends State<TutorReviews> {
// Sample review data
  final List<Map<String, String>> reviews = List.generate(
    20, // Increased count to check vertical scrolling
    (index) => {
      "userID": "0${index + 1}",
      "name": "Buthxi",
      "review": "Buthxi@gmail.com",
      "date": "24/12/2024",
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TutorHive',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tutor Review',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20.0,
                  border: TableBorder.all(color: Colors.black54),
                  headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
                  columns: [
                    DataColumn(label: Text('UserID', style: _columnStyle())),
                    DataColumn(label: Text('Name', style: _columnStyle())),
                    DataColumn(label: Text('Review', style: _columnStyle())),
                    DataColumn(label: Text('Date', style: _columnStyle())),
                    DataColumn(label: Text('Action', style: _columnStyle())),
                  ],
                  rows: reviews.map((review) {
                    return DataRow(cells: [
                      DataCell(Text(review["userID"]!)),
                      DataCell(Text(review["name"]!)),
                      DataCell(Text(review["review"]!)),
                      DataCell(Text(review["date"]!)),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.check_circle, color: Colors.green),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Column Header Text Style
  TextStyle _columnStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  }
}
