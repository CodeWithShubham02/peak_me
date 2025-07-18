import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/new_lead_model.dart';



class ReceivedLeadController{

  Future<List<Lead>> fetchLeads({
    required String uid,
    required int start,
    required int end,
    required String branchId,
    required String appVersion,
    required String appType,
  }) async {
    final url = Uri.parse('https://fms.bizipac.com/ws/new_lead.php?uid=$uid&start=$start&end=$end&branch_id=$branchId&app_version=$appVersion&app_type=$appType');

    final response = await http.get(url);
    print('--------lead detail---------');
    print(response.body);
    print('-----------------');

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
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