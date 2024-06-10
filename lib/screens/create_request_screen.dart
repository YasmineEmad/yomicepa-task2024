import 'package:flutter/material.dart';
import 'package:yomicepa_mobile_task/apis/pharmsy_apis.dart';
import 'package:yomicepa_mobile_task/apis/request_apis.dart';
import 'package:yomicepa_mobile_task/models/pharmacy_link_model.dart';
import 'package:yomicepa_mobile_task/models/user_model.dart';
import 'package:yomicepa_mobile_task/screens/add_item_screen.dart';

class CreateRequestScreen extends StatefulWidget {
  UserModel user;
   CreateRequestScreen({required this.user,super.key});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  String? _selectedServiceType;
  WholesalerModel? _selectedWholesaler;
  bool _isLoading = false;
  List<WholesalerModel> _wholesalers = [];
  final List<String> _serviceTypes = ['EXPRESS_SERVICE', 'FULL_SERVICE'];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchWholesalers();
  }
  Future<void> _fetchWholesalers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<WholesalerModel> wholesalers =
      await PharmacyAPI().listWholesalersForPharmacy(200, widget.user.token);
      setState(() {
        _wholesalers = wholesalers;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:() {Navigator.of(context).pop();}, icon:const Icon(Icons.arrow_back)),
        title: const Text('Create Return Requests'),
      ),
      body:
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedServiceType,
                    items: _serviceTypes.map((String serviceType) {
                      return DropdownMenuItem<String>(
                        value: serviceType,
                        child: Text(serviceType),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedServiceType = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please choose Service Type";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Service Type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<WholesalerModel>(
                    value: _selectedWholesaler,
                    items: _wholesalers.map((WholesalerModel wholesaler) {
                      return DropdownMenuItem<WholesalerModel>(
                        value: wholesaler,
                        child: Text(wholesaler.name),
                      );
                    }).toList(),
                    onChanged: (WholesalerModel? newValue) {
                      setState(() {
                        _selectedWholesaler = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please choose a Wholesaler";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Wholesaler',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          int returnRequestId = await ReturnRequestAPI().createReturnRequest(
                            widget.user.token,
                            200,
                            _selectedServiceType!,
                            _selectedWholesaler!.id,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => AddItemScreen(user: widget.user,
                            pharmacyId: 200,
                            returnRequestId: returnRequestId,)),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
        ],
      ),
            ),
          )
    );
  }
}
