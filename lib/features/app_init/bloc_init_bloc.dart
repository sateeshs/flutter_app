import 'package:flutter_app/features/bloc_helpers/bloc_event_state.dart';

import 'app_init_event.dart';
import 'app_init_state.dart';

class ApplicationInitializationBloc
    extends BlocEventStateBase<ApplicationInitializationEvent, ApplicationInitializationState> {
  ApplicationInitializationBloc()
      : super(
          initialState: ApplicationInitializationState.notInitialized(),
        );

  @override
  Stream<ApplicationInitializationState> eventHandler(
      ApplicationInitializationEvent event, ApplicationInitializationState currentState) async* {
    
    if (!currentState.isInitialized){
      yield ApplicationInitializationState.notInitialized();
    }

    if (event.type == ApplicationInitializationEventType.start) {
      for (int progress = 0; progress < 101; progress += 10){
        await Future.delayed(const Duration(milliseconds: 300));
        yield ApplicationInitializationState.progressing(progress);
      }
    }

    if (event.type == ApplicationInitializationEventType.stop){
      yield ApplicationInitializationState.initialized();
    }
  }
}