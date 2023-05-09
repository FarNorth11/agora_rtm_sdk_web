@JS('AgoraRTM')
library agora_rtm_sdk;

import 'package:js/js.dart';
import 'rtm_events.dart';

external RtmClient createInstance(String appId, [dynamic config]);

@JS()
class PeersOnlineStatusResult {
  external Map<String, bool> peerId;
}

@JS()
@anonymous
class LoginOptions {
  external factory LoginOptions({String uid, String? token});

  external String get uid;
  external String? get token;
}

@JS()
class RtmClient {
  external Future<void> login(LoginOptions options);

  external Future<void> logout();

  external Future<PeerMessageSendResult> sendMessageToPeer(
      RtmTextMessage message, String peerId);

  external Future<void> subscribePeersOnlineStatus(List<String> peerIds);

  external void on(String event, void Function(PeersOnlineStatusMap peerId) listener);
}

@JS()
class PeerMessageSendResult {
  external bool hasPeerReceived;
}

@JS()
@anonymous
class RtmTextMessage {
  external factory RtmTextMessage({String text});

  external String text;
}

