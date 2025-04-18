import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'strpe_keys.dart';

abstract class PaymentManger{
static Future<void> mackPayment(int amount,String currency)async{
  try {
      String clientSecret =await _getClientSecret((amount*100).toString(), currency);
await _initPaymentSheet(clientSecret);
await Stripe.instance.presentPaymentSheet();
  } catch (error) {
    throw Exception('Payment Error: $error');
  }

}
static Future<void> _initPaymentSheet(String clientSecret)async{
 await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
    paymentIntentClientSecret: clientSecret,
    merchantDisplayName: 'PharmacyGaza'
  ));
}

static Future<String> _getClientSecret(String amount, String currency) async{
  Dio dio = Dio();
  final response = await dio.post('https://api.stripe.com/v1/payment_intents',
  options: Options(
    headers: {
      'Authorization': 'Bearer ${StripeKeys.secretKey}',
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  
  ),
  data: {
    'amount': amount,
    'currency': currency,
  }
  );
return response.data['client_secret'];
}}
