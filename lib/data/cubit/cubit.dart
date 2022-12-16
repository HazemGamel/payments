
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/app/constants.dart';
import 'package:payment/data/cubit/cubitStates.dart';
import 'package:payment/data/dioHelper.dart';

class PaymentCubit extends Cubit<PaymentState>{

  PaymentCubit() : super(paymentinitalstate());

  static PaymentCubit get(context) =>BlocProvider.of(context);

   Future getFirestToken(String price,String firest
       ,String second ,String email,String phone)async {
     DioHelper().postdata(url: "auth/tokens", data: {
       "api_key": paymentKey
     }).then((value) {
       FirestToken = value.data["token"];
       getOrderId(price, firest, second, email, phone);
       print("firest token $FirestToken");
       emit(paymentfirestTokenSuccess());
     }).catchError((error) {
       print("error to catch firest token $error");
       emit(paymentfirestTokenError(error));
     });
   }

  Future getOrderId(String price,String firest
      ,String second ,String email,String phone)async{
    DioHelper().postdata(url: "ecommerce/orders", data: {
      "auth_token":FirestToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items":[]
    }).then((value) {
      OrderId=value.data["id"].toString();
      print("order id  $OrderId");
      getPaymentTokenCard(price, firest, second, email, phone);
      //getPaymentTokenKiosk(price, firest, second, email, phone);
      emit(paymentOrderIdSuccess());
    }).catchError((error){
      print("error to catch order id $error");
      emit(paymentOrderIdError(error));
    });
  }

  Future getPaymentTokenCard(String price,String firest
      ,String second ,String email,String phone)async{
    DioHelper().postdata(url:"acceptance/payment_keys",
        data: {
      "auth_token":FirestToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": OrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firest,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method":"NA",
        "postal_code":"NA",
        "city": "NA",
        "country": "NA",
        "last_name": second,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id":2384596,
      "lock_order_when_paid": "false"
    }).then((value) {
      PaymentTokenCard=value.data['token'];
      //getPaymentTokenKiosk(price, firest, second, email, phone);
      print("PaymentToken is  $PaymentTokenCard");

      emit(paymentTokenSuccess());
    }).catchError((error){
      print("error to catch PaymentToken $error");
      emit(paymentTokenError(error));
    });
  }
//this code for Kiosk Payments
//  Future getPaymentTokenKiosk(String price,String firest
//      ,String second ,String email,String phone)async{
//    DioHelper().postdata(url:"acceptance/payment_keys",
//        data: {
//      "auth_token":PaymentTokenCard,
//      "amount_cents": price,
//      "expiration": 3600,
//      "order_id": OrderId,
//      "billing_data": {
//        "apartment": "NA",
//        "email": email,
//        "floor": "NA",
//        "first_name": firest,
//        "street": "NA",
//        "building": "NA",
//        "phone_number": phone,
//        "shipping_method":"NA",
//        "postal_code":"NA",
//        "city": "NA",
//        "country": "NA",
//        "last_name": second,
//        "state": "NA"
//      },
//      "currency": "EGP",
//      "integration_id":2395869,
//      "lock_order_when_paid": "false"
//    }).then((value) {
//      print(value.data);
//      PaymentTokenKiosk=value.data["token"];
//      getReferCode();
//      print("PaymentTokenKiosk is  $PaymentTokenKiosk");
//      emit(paymentTokenKioskSuccess());
//    }).catchError((error){
//      print("error to catch PaymentTokenKiosk ${error.toString()}");
//      emit(paymentTokenKioskError(error));
//    });
//  }
//
//  Future getReferCode()async{
//     DioHelper().postdata(url: "acceptance/payments/pay", data: {
//       "source": {
//         "identifier": "AGGREGATOR",
//         "subtype": "AGGREGATOR"
//       },
//       "payment_token": PaymentTokenKiosk,
//     }).
//     then((value) {
//       RefCode=value.data["id"].toString();
//       print("RefCode is $RefCode");
//       emit(paymentRefCodeSuccess());
//     }).catchError((error){
//      print("error to catch refcode");
//      emit(paymentRefCodeError(error));
//     });
//  }


}