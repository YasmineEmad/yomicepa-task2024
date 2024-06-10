import 'package:flutter/material.dart';
import 'package:yomicepa_mobile_task/apis/request_apis.dart';
import 'package:yomicepa_mobile_task/models/request_model.dart';
import 'package:yomicepa_mobile_task/models/user_model.dart';
import 'package:yomicepa_mobile_task/screens/create_request_screen.dart';

class ReturnRequestsScreen extends StatefulWidget {
  static const String routeName = "requests screen";
  final UserModel user;

  ReturnRequestsScreen({required this.user, super.key});

  @override
  State<ReturnRequestsScreen> createState() => _ReturnRequestScreenState();
}

class _ReturnRequestScreenState extends State<ReturnRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return Requests'),
      ),
      body: FutureBuilder<ReturnRequestListModel>(
        future: ReturnRequestAPI().listReturnRequests(widget.user.token, 200),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.content.isEmpty) {
            return const Center(child: Text('No return requests found.'));
          } else {
            final returnRequests = snapshot.data!.content;
            return ListView.builder(
              itemCount: returnRequests.length,
              itemBuilder: (context, index) {
                final returnRequestItem = returnRequests[index];
                final returnRequest = returnRequestItem.returnRequest;
                return Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all()
                  ),
                  child: ListTile(
                    title: Text('ID: ${returnRequest.id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Created At: ${returnRequest.createdAt}'),
                        Text('Number of items: ${returnRequestItem.numberOfItems}'),
                        Text('Status: ${returnRequest.returnRequestStatusLabel}'),
                        Text('Service Type: ${returnRequest.serviceType}'),
                        Text('Wholesaler: ${returnRequest.pharmacy.doingBusinessAs}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateRequestScreen(user: widget.user)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
