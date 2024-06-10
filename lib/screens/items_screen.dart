import 'package:flutter/material.dart';
import 'package:yomicepa_mobile_task/apis/request_apis.dart';
import 'package:yomicepa_mobile_task/models/item_model.dart';
import 'package:yomicepa_mobile_task/models/user_model.dart';

class ItemsScreen extends StatefulWidget {
  final UserModel user;
  final int pharmacyId;
  final int returnRequestId;
  const ItemsScreen({
    required this.user,
    required this.pharmacyId,
    required this.returnRequestId,
    super.key,
  });

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<AllItemsModel> _items = [];

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    try {
      List<AllItemsModel> items = await ReturnRequestAPI().listItemsInReturnRequest(
        widget.user.token,
        widget.pharmacyId,
        widget.returnRequestId,
      );
      setState(() {
        _items = items;
      });
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchItems();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Items'),
        ),
        body: _items.isEmpty
            ? const Center(
                child: Text('No items found.'),
              )
            : ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon:const Icon(Icons.edit),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon:const Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Item'),
                                content: const Text('Are you sure you want to delete this item?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ));
  }
}
