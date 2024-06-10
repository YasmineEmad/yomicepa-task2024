import 'package:yomicepa_mobile_task/apis/api_handler.dart';
import 'package:yomicepa_mobile_task/models/pharmacy_link_model.dart';
import 'package:yomicepa_mobile_task/models/pharmcy_model.dart';

class PharmacyAPI {
  Future<List<PharmacyModel>> listPharmacies(String token) async {
    final response = await ApiHandler.get('/pharmacies/management', token);

    List<dynamic> body = response;
    return body.map((dynamic item) => PharmacyModel.fromJson(item)).toList();
  }
  Future<List<WholesalerModel>> listWholesalersForPharmacy(int pharmacyId, String token) async {
    final response = await ApiHandler.get('/pharmacies/$pharmacyId/wholesalers', token);
    List<dynamic> body = response;
    return body.map((dynamic item) => WholesalerModel.fromJson(item)).toList();
  }
}
