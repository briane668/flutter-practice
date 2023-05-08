import 'dart:core';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (WebRTC.platformIsDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  } else if (WebRTC.platformIsAndroid) {
    //startForegroundService();
  }

  runApp(MyApp());
}

Future<bool> startForegroundService() async {
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: 'Title of the notification',
    notificationText: 'Text of the notification',
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(
        name: 'background_icon',
        defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );
  await FlutterBackground.initialize(androidConfig: androidConfig);
  return FlutterBackground.enableBackgroundExecution();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter-WebRTC example'),
          ),
          body: VideoPlayer(MediaStream)),
    );
  }
}

class VideoPlayer extends StatefulWidget {
  final MediaStream mediaStream;

  VideoPlayer(this.mediaStream);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final Map<String, dynamic> mediaConstraints = {
    'audio': true,
    'video': {
      'facingMode': 'user',
    }
  };

  final _localRenderer = RTCVideoRenderer();

  final _remoteRenderer = RTCVideoRenderer();
  @override
  void initState() {
    super.initState();
    _localRenderer.initialize();

    _remoteRenderer.initialize();
    _remoteRenderer.srcObject = widget.mediaStream;
    _localRenderer.srcObject = widget.mediaStream;
  }

  final configuration = <String, dynamic>{
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'}
    ]
  };

  final offerSdpConstraints = <String, dynamic>{
    'mandatory': {
      'OfferToReceiveAudio': true,
      'OfferToReceiveVideo': true,
    },
    'optional': [],
  };

  Future<void> run() async {
    final localStream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);

    final peerConnection = await createPeerConnection(configuration);

    peerConnection.addStream(localStream);

    final offer = await peerConnection.createOffer(offerSdpConstraints);
    await peerConnection.setLocalDescription(offer);
    peerConnection.onAddStream = (stream) {
      setState(() {
        _remoteRenderer.srcObject = stream;
      });
    };
  }

  @override
  void dispose() {
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RTCVideoView(_remoteRenderer);
  }
}
