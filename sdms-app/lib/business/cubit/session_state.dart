part of 'session_cubit.dart';

@freezed
class SessionState with _$SessionState {
  /// The SessionState, which is just a wrapper for a [Session]
  const factory SessionState(Session session) = _SessionState;
}
