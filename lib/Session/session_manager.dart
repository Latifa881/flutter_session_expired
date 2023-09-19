import 'package:flutter/material.dart';
import 'dart:async';

class SessionManager extends StatefulWidget {
  Widget child;
  VoidCallback onSessionExpired;
  Duration duration;
  StreamController streamController;

  SessionManager(
      {super.key,
      required this.child,
      required this.onSessionExpired,
      required this.duration,
      required this.streamController});

  @override
  State<SessionManager> createState() => _SessionManagerState();
}

class _SessionManagerState extends State<SessionManager> {
  Timer? _timer;
  StreamController? streamController;

  @override
  void initState() {
    super.initState();
    streamController = StreamController();
    streamController = widget.streamController;
    if (streamController != null) {
      streamController!.stream.listen((event) {
        if (event != null && event['timer'] as bool) {
          sessionStart();
        } else {
          closeTimer();
        }
      });
    }
  }

  void sessionStart() {
    closeTimer();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      widget.onSessionExpired();
      closeTimer();
    });
  }

  void closeTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        sessionStart();
      },
      onPointerCancel: (_){
        sessionStart();
      },
      onPointerHover: (_){
        sessionStart();
      },
      onPointerMove: (_){
        sessionStart();
      },
      onPointerPanZoomStart: (_){
        sessionStart();
      },
      onPointerPanZoomEnd: (_){
        sessionStart();
    },
      onPointerPanZoomUpdate: (_){
        sessionStart();
      },
      onPointerSignal: (_){
        sessionStart();
      },
      onPointerUp: (_){
        sessionStart();
      },
      child: widget.child,
    );
  }
}
