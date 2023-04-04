// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/data/models/session.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';

part 'session_state.dart';
part 'session_cubit.freezed.dart';

/// The cubit for session auth state, handling loggedIn and loggedOut events.
class SessionCubit extends Cubit<SessionState> {
  /// The [SessionRepository] singleton, which we use for its event stream
  final SessionRepository _sessionRepository;

  /// A listener, which we keep a reference to so we can cancel it on [close].
  late StreamSubscription _onSessionTypeChangeSubscription;

  SessionCubit({required SessionRepository sessionRepository})
      : _sessionRepository = sessionRepository,
        super(SessionState(sessionRepository.session)) {
    _onSessionTypeChangeSubscription =
        _sessionRepository.onSessionTypeChange.listen(_onSessionTypeChange);
  }

  /// Calls logout on the session.
  ///
  /// Login is handled in the SignInCubit or SignUpCubit
  void logOut() {
    //This will trigger the _onSessionTypeChange listener, so no state updates here.
    _sessionRepository.logout();
  }

  /// Handles session updates from the [SessionRepository].
  void _onSessionTypeChange(Session session) {
    emit(SessionState(session));
  }

  @override
  Future<void> close() {
    _onSessionTypeChangeSubscription.cancel();
    return super.close();
  }
}
