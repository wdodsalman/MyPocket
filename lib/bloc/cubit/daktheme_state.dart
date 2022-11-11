import 'package:equatable/equatable.dart';

abstract class DakthemeState extends Equatable {
  DakthemeState(this.version);
 
  /// notify change state without deep clone state
  final int version;

  /// Copy object for use in action
  /// if need use deep clone
  DakthemeState getStateCopy();

  DakthemeState getNewVersion();

  @override
  List<Object> get props => [version];
}

/// UnInitialized
class UnDakthemeState extends DakthemeState {

  UnDakthemeState(int version) : super(version);

  @override
  String toString() => 'UnDakthemeState';

  @override
  UnDakthemeState getStateCopy() {
    return UnDakthemeState(0);
  }

  @override
  UnDakthemeState getNewVersion() {
    return UnDakthemeState(version+1);
  }
}

/// Initialized
class InDakthemeState extends DakthemeState {
  
  InDakthemeState(int version, this.hello) : super(version);
 
  final String hello;

  @override
  String toString() => 'InDakthemeState $hello';

  @override
  InDakthemeState getStateCopy() {
    return InDakthemeState(version, hello);
  }

  @override
  InDakthemeState getNewVersion() {
    return InDakthemeState(version+1, hello);
  }

  @override
  List<Object> get props => [version, hello];
}

class ErrorDakthemeState extends DakthemeState {
  ErrorDakthemeState(int version, this.errorMessage): super(version);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorDakthemeState';

  @override
  ErrorDakthemeState getStateCopy() {
    return ErrorDakthemeState(version, errorMessage);
  }

  @override
  ErrorDakthemeState getNewVersion() {
    return ErrorDakthemeState(version+1, 
    errorMessage);
  }

  @override
  List<Object> get props => [version, errorMessage];
}
