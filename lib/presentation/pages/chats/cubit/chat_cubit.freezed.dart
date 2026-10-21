// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState()';
}


}

/// @nodoc
class $ChatStateCopyWith<$Res>  {
$ChatStateCopyWith(ChatState _, $Res Function(ChatState) __);
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatStateInitial value)?  initial,TResult Function( ChatStateLoading value)?  loading,TResult Function( ChatStateLoaded value)?  loaded,TResult Function( ChatStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatStateInitial() when initial != null:
return initial(_that);case ChatStateLoading() when loading != null:
return loading(_that);case ChatStateLoaded() when loaded != null:
return loaded(_that);case ChatStateError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatStateInitial value)  initial,required TResult Function( ChatStateLoading value)  loading,required TResult Function( ChatStateLoaded value)  loaded,required TResult Function( ChatStateError value)  error,}){
final _that = this;
switch (_that) {
case ChatStateInitial():
return initial(_that);case ChatStateLoading():
return loading(_that);case ChatStateLoaded():
return loaded(_that);case ChatStateError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatStateInitial value)?  initial,TResult? Function( ChatStateLoading value)?  loading,TResult? Function( ChatStateLoaded value)?  loaded,TResult? Function( ChatStateError value)?  error,}){
final _that = this;
switch (_that) {
case ChatStateInitial() when initial != null:
return initial(_that);case ChatStateLoading() when loading != null:
return loading(_that);case ChatStateLoaded() when loaded != null:
return loaded(_that);case ChatStateError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ChatModel> models)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatStateInitial() when initial != null:
return initial();case ChatStateLoading() when loading != null:
return loading();case ChatStateLoaded() when loaded != null:
return loaded(_that.models);case ChatStateError() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ChatModel> models)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case ChatStateInitial():
return initial();case ChatStateLoading():
return loading();case ChatStateLoaded():
return loaded(_that.models);case ChatStateError():
return error(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ChatModel> models)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case ChatStateInitial() when initial != null:
return initial();case ChatStateLoading() when loading != null:
return loading();case ChatStateLoaded() when loaded != null:
return loaded(_that.models);case ChatStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ChatStateInitial implements ChatState {
  const ChatStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState.initial()';
}


}




/// @nodoc


class ChatStateLoading implements ChatState {
  const ChatStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState.loading()';
}


}




/// @nodoc


class ChatStateLoaded implements ChatState {
  const ChatStateLoaded(final  List<ChatModel> models): _models = models;
  

 final  List<ChatModel> _models;
 List<ChatModel> get models {
  if (_models is EqualUnmodifiableListView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_models);
}


/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateLoadedCopyWith<ChatStateLoaded> get copyWith => _$ChatStateLoadedCopyWithImpl<ChatStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatStateLoaded&&const DeepCollectionEquality().equals(other._models, _models));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_models));

@override
String toString() {
  return 'ChatState.loaded(models: $models)';
}


}

/// @nodoc
abstract mixin class $ChatStateLoadedCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $ChatStateLoadedCopyWith(ChatStateLoaded value, $Res Function(ChatStateLoaded) _then) = _$ChatStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<ChatModel> models
});




}
/// @nodoc
class _$ChatStateLoadedCopyWithImpl<$Res>
    implements $ChatStateLoadedCopyWith<$Res> {
  _$ChatStateLoadedCopyWithImpl(this._self, this._then);

  final ChatStateLoaded _self;
  final $Res Function(ChatStateLoaded) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? models = null,}) {
  return _then(ChatStateLoaded(
null == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as List<ChatModel>,
  ));
}


}

/// @nodoc


class ChatStateError implements ChatState {
  const ChatStateError(this.error);
  

 final  String error;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateErrorCopyWith<ChatStateError> get copyWith => _$ChatStateErrorCopyWithImpl<ChatStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ChatState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ChatStateErrorCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $ChatStateErrorCopyWith(ChatStateError value, $Res Function(ChatStateError) _then) = _$ChatStateErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ChatStateErrorCopyWithImpl<$Res>
    implements $ChatStateErrorCopyWith<$Res> {
  _$ChatStateErrorCopyWithImpl(this._self, this._then);

  final ChatStateError _self;
  final $Res Function(ChatStateError) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ChatStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
