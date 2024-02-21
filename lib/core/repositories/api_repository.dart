import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_food_app/core/models/signup_request_model.dart';

class ApiRepository extends GetConnect {
  // Post API service
  @override
  void onInit() {
    httpClient.baseUrl = 'https://gorest.co.in/public/v2';
  }

  Future<Response<SignUpRequestModel>> create(
    SignUpRequestModel signUpRequestModel,
  ) async {
    try {
      final response = await post('/users', signUpRequestModel.toJson(),
          decoder: (data) => SignUpRequestModel.fromJson(data),
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer a9a486e9e05ae8f3998761fba962fa5c8bdfd58b227d425373b4566717afd33c"
          });
      log("${response.statusCode}");
      return response;
    } catch (e) {
      return const Response<SignUpRequestModel>(statusCode: 500);
    }
  }
}



//   static Dio dio = Dio();
//   //post api service
//   Future postData(SignUpRequestModel signUpRequestModel) async {
//     Response response;
//     try {
//       response = await dio.post(
//         "https://gorest.co.in/public/v2/users",
//         data: signUpRequestModelToJson(signUpRequestModel),
//         options: Options(headers: {
//           "Content-Type": "application/json",
//           "Authorization":
//               "Bearer a9a486e9e05ae8f3998761fba962fa5c8bdfd58b227d425373b4566717afd33c"
//         }),
//       );
//       var res = response.statusCode;
//       return res;
//     } catch (e) {
//       log("Exception $e");
//     }
//   }
// }

// Future<Response> postData(
//     SignUpRequestModel signUpRequestModel,
//   ) async {
//     try {
//       Response response = await post(
//         'https://gorest.co.in/public/v2/users',
//         {
//           "email": "Kash50@gmail.com",
//           "name": "KAshish",
//           "gender": "female",
//           "status": "active"
//         },
//         //signUpRequestModel,
//         decoder: (data) => SignUpRequestModel.fromJson(data),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Authorization':
//               'Bearer a4b24edb2eaa5a68d37e65e6ba2fcd73ca0650d2cfd0410de3eb95252a61c73c',
//         },
//       ).timeout(const Duration(seconds: 10));
//       log("${response.body}");
//       return response;
//     } catch (e) {
//       return Response(statusCode: 1, statusText: e.toString());
//     }
//   }