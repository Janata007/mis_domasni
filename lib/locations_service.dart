import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class LocationService{
  final String key='AIzaSyD_pHCRL-0-sPs_Bu5kvBVAZvVd5xED9Qs';

  Future<String> getPlaceId(String input) async{
final String url ='https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
var response = await http.get(Uri.parse(url));
var json = convert.jsonDecode(response.body);
var placeId = json['candidates'][0]['place_id'] as String;
print("PLACE ID:" + placeId);
return placeId;
  }
  Future<void> getDirections(String origin, String destination) async{

  }
}