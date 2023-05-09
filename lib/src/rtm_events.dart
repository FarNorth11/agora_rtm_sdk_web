// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names

@JS('AgoraRTM.RtmEvents')
library rtm_events;

import 'package:js/js.dart';

@JS()
class PeersOnlineStatusMap {
  external Map<String, dynamic> peerId;
}