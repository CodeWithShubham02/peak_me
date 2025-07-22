import 'dart:convert';
import 'package:http/http.dart' as http;

import '../handler/EncryptionHandler.dart';
import '../model/new_lead_model.dart';


class ReceivedAllLeadController {
  Future<List<Lead>> fetchLeads({
    required String uid,
    required int start,
    required int end,
    required String branchId,
    required String app_version,
    required String appType,
  }) async {

    print("Uid : ${uid}");
    print("start : ${start}");
    print("end : ${end}");
    print("branchId : ${branchId}");
    print("app_version : ${app_version}");
    print("appType : ${appType}");

    final encryptedUid = EncryptionHelper.encryptData(uid);
    final encryptedStart = EncryptionHelper.encryptData(start.toString());
    final encryptedEnd = EncryptionHelper.encryptData(end.toString());
    final encryptedBranchId = EncryptionHelper.encryptData(branchId);
    final encryptedAppVersion = EncryptionHelper.encryptData(app_version);
    final encryptedAppType = EncryptionHelper.encryptData(appType);

    print('--------Encrypted API Response---------');
    print(' Uid : ${encryptedUid}+${encryptedStart}+${encryptedEnd}+${encryptedBranchId}+${encryptedAppVersion}+${encryptedAppType}');

    //final url = Uri.parse('https://fms.bizipac.com/ws/new_lead.php?uid=$encryptedUid&start=$encryptedStart&end=$encryptedEnd&branch_id=$encryptedBranchId&app_version=$encryptedAppVersion&app_type=$encryptedAppType');


    final url = Uri.parse('https://fms.bizipac.com/ws/new_lead.php?uid=$uid&start=$start&end=$end&branch_id=$branchId&app_version=$app_version&app_type=$appType');
    final response = await http.get(url);

    // print('-------- API Response Data---------');
    // print(response.body);

    final ecryptedResponse = EncryptionHelper.encryptData(response.body);
    print('--------Encrypted Response---------');
    print(ecryptedResponse);

    print('--------------------------------------');
    if(response.statusCode == 200) {
      final decryptedResponse = EncryptionHelper.decryptData(ecryptedResponse);

      print('--------Decrypted Response---------');
      print(decryptedResponse);


      final jsonBody = json.decode(decryptedResponse);
      //print(jsonBody);
      if (jsonBody['success'] == 1) {
        final List<dynamic> leadsJson = jsonBody['data'];
        return leadsJson.map((json) => Lead.fromJson(json)).toList();
      } else {
        throw Exception('Server Error: ${jsonBody['message']}');
      }
    } else {
      throw Exception('Failed to load leads. Status Code: ${response.statusCode}');
    }
  }
}