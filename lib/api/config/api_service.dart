
import 'package:training_project/helper/helper_export.dart';


class APIService {

  static Map<String, String> header() {
    return  {
      'Authorization' : AppPreference.getAccessToken().toString(),
    };
  }

  static Map<String, String> header_content_type(content_type) {
    return  {
      'Authorization' : AppPreference.getAccessToken().toString(),
      'Content-Type' : content_type,
    };
  }


}