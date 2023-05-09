import 'package:flutter/material.dart';

import 'package:agora_rtm_sdk_web/agora_rtm_sdk_web.dart';

const kAppId = 'add68c136d814633aa843407988908a3';
const kUid = '888';
const kPeerId = '999';
const kRtmToken =
    '006add68c136d814633aa843407988908a3IACJOyZNOxnMB5nqvxvTIn2wIGDCzFfoGsDuSV9q4Z89e19ppOoAAAAACgCCLGR5xUZbZAAA';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RtmClient? rtmClient;
  @override
  void initState() {
    super.initState();
    rtmClient = createInstance(kAppId);
  }

  void handleLogin() {
    rtmClient!.login(LoginOptions(uid: kUid, token: kRtmToken));
  }

  void handleLogout() {
    rtmClient!.logout();
  }

  void handleSendMessageToPeer() {
    rtmClient!.sendMessageToPeer(
        RtmTextMessage(text: 'Current time is ${DateTime.now()}'), kPeerId);
  }

  void handleSubscribePeersOnlineStatus() {
    rtmClient!.subscribePeersOnlineStatus([kPeerId]);

    rtmClient!.on('PeersOnlineStatusChanged', allowInterop((peerId) {
      print(peerId);
      print(peerId.runtimeType);
      print(peerId.peerId);

    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: handleLogin,
                  child: const Text('login')),
              const SizedBox(height: 24),
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: handleLogout,
                  child: const Text('logout')),
              const SizedBox(height: 24),
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: handleSendMessageToPeer,
                  child: const Text('sendMessageToPeer')),
              const SizedBox(height: 24),
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: handleSubscribePeersOnlineStatus,
                  child: const Text('subscribePeersOnlineStatus'))
            ],
          ),
        ),
      ),
    );
  }
}
