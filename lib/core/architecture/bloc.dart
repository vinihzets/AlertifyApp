import 'dart:async';
import 'package:alertifyapp/core/architecture/bloc_state.dart';
import 'package:alertifyapp/core/architecture/event.dart';
import 'package:alertifyapp/core/utils/hud_mixins.dart';

abstract class Bloc with HudMixins {
  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<Event> _event;
  Sink<Event> get event => _event.sink;

  Bloc() {
    _state = StreamController.broadcast();
    _event = StreamController.broadcast();

    _event.stream.listen(mapListenEvent);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  dispatchEvent(Event event) {
    _event.add(event);
  }

  mapListenEvent(Event event);
}
