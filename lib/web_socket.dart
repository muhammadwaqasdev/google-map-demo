import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketApp extends StatefulWidget {
  const WebSocketApp({Key? key}) : super(key: key);

  @override
  State<WebSocketApp> createState() => _WebSocketAppState();
}

class _WebSocketAppState extends State<WebSocketApp> {
  String btcUsdtPrice = "0";
  late WebSocketChannel channel;
  @override
  void initState() {
    channel = IOWebSocketChannel.connect('wss://stream.binance.com:9443/ws/btcusdt@trade');
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((message) {
      // channel.sink.add('received!');
      // channel.sink.close(status.goingAway);
      Map getData = jsonDecode(message);
      setState(() {
        btcUsdtPrice = getData['p'];
      });
      // print(getData['p']);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BTC/USDT Price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                btcUsdtPrice,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 250, 194, 25),
                    fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
