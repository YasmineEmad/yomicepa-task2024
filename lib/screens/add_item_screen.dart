import 'package:flutter/material.dart';
import 'package:yomicepa_mobile_task/apis/request_apis.dart';
import 'package:yomicepa_mobile_task/models/item_model.dart';
import 'package:yomicepa_mobile_task/models/user_model.dart';
import 'package:yomicepa_mobile_task/screens/items_screen.dart';

class AddItemScreen extends StatefulWidget {
  final UserModel user;
  final int pharmacyId;
  final int returnRequestId;

  AddItemScreen({
    required this.user,
    required this.pharmacyId,
    required this.returnRequestId,
    super.key,
  });

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ndcController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _manufacturerController = TextEditingController();
  final _fullQuantityController = TextEditingController();
  final _partialQuantityController = TextEditingController();
  final _expirationDateController = TextEditingController();
  final _lotNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_ndcController, 'NDC'),
              const SizedBox(height: 16.0),
              _buildTextField(_descriptionController, 'Description'),
              const SizedBox(height: 16.0),
              _buildTextField(_manufacturerController, 'Manufacturer'),
              const SizedBox(height: 16.0),
              _buildTextField(_fullQuantityController, 'Full Quantity'),
              const SizedBox(height: 16.0),
              _buildTextField(_partialQuantityController, 'Partial Quantity'),
              const SizedBox(height: 16.0),
              _buildTextField(_expirationDateController, 'Expiration Date (YYYY-MM)'),
              const SizedBox(height: 16.0),
              _buildTextField(_lotNumberController, 'Lot Number'),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Add Item'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ItemsScreen(
                        user: widget.user,
                        pharmacyId: widget.pharmacyId,
                        returnRequestId: widget.returnRequestId,)),
                    );
                  },
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Future<void> _submit() async {
      ItemModel newItem = ItemModel(
        ndc: _ndcController.text.isEmpty ? '8040-4444-333' : _ndcController.text,
        description: _descriptionController.text.isEmpty ? 'This is a new drug' : _descriptionController.text,
        manufacturer: _manufacturerController.text.isEmpty ? 'Nicolas LLC' : _manufacturerController.text,
        packageSize: '200',
        requestType: 'csc',
        name: 'Best Item Name',
        strength: 'strong',
        dosage: 'alssot',
        fullQuantity: _fullQuantityController.text.isEmpty ? '500' : _fullQuantityController.text,
        partialQuantity: _partialQuantityController.text.isEmpty ? '100' : _partialQuantityController.text,
        expirationDate: _expirationDateController.text.isEmpty ? '2021-08' : _expirationDateController.text,
        status: 'PENDING',
        lotNumber: _lotNumberController.text.isEmpty ? '1231313' : _lotNumberController.text,
      );

      try {
        await ReturnRequestAPI().addItemToReturnRequest(
          widget.user.token,
          widget.pharmacyId,
          widget.returnRequestId,
          newItem,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item added successfully')),
        );

        _formKey.currentState!.reset(); // Clear the form
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding item: $error')),
        );
      }
    }
}
