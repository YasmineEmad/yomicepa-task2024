import 'package:yomicepa_mobile_task/apis/api_handler.dart';
import 'package:yomicepa_mobile_task/models/item_model.dart';
import 'package:yomicepa_mobile_task/models/request_model.dart';


class ReturnRequestAPI {
  Future<ReturnRequestListModel> listReturnRequests(String token, int pharmacyId) async {
    final response = await ApiHandler.getMap('/pharmacies/$pharmacyId/returnrequests', token);
    var body = ReturnRequestListModel.fromJson(response);
    return body;
  }

  Future<int> createReturnRequest(String token, int pharmacyId, String serviceType, int wholesalerId) async {
    final response = await ApiHandler.post('/pharmacies/$pharmacyId/returnrequests', {
      'serviceType': serviceType,
      'wholesalerId': wholesalerId,
    }, token);
    return response['id'];
  }

  Future<void> addItemToReturnRequest(String token, int pharmacyId, int returnRequestId, ItemModel item) async {
    await ApiHandler.post('/pharmacies/$pharmacyId/returnrequests/$returnRequestId/items', item.toJson(),token);
  }

  Future<void> updateItemInReturnRequest(String token, int pharmacyId, int returnRequestId, int itemId, ItemModel item) async {
    await ApiHandler.put('/pharmacies/$pharmacyId/returnrequests/$returnRequestId/items/$itemId', item.toJson(), token);
  }

  Future<void> deleteItemInReturnRequest(String token, int pharmacyId, int returnRequestId, int itemId) async {
    await ApiHandler.delete('/pharmacies/$pharmacyId/returnrequests/$returnRequestId/items/$itemId', token);
  }

  Future<List<AllItemsModel>> listItemsInReturnRequest(String token, int pharmacyId, int returnRequestId) async {
    final response = await ApiHandler.get('/pharmacies/$pharmacyId/returnrequests/$returnRequestId/items', token);
    List<dynamic> body = response;
    List<AllItemsModel> items = body.map((dynamic item) => AllItemsModel.fromJson(item)).toList();
    return items;
  }
}
