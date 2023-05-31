import 'dart:convert';

import 'package:surokkha/modals/post_data_modal.dart';
import 'package:surokkha/modals/post_data_response_modal.dart';
import 'package:surokkha/utils/apis.dart';
import 'package:http/http.dart' as http;

class PostData {
  Future<PostDataResponseModal> post(PostDataModal data) async {
    final response =
        await http.post(Uri.parse(Api.BASE_URL + Api.GENERATE_PDF), body: data);
    final body = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return PostDataResponseModal.fromJson(body);
    } else {
      return PostDataResponseModal.fromJson(body);
    }
  }
}
