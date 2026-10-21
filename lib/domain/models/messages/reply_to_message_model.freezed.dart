// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_to_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyToMessageModel {

 String get id;
/// Create a copy of ReplyToMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyToMessageModelCopyWith<ReplyToMessageModel> get copyWith => _$ReplyToMessageModelCopyWithImpl<ReplyToMessageModel>(this as ReplyToMessageModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyToMessageModel&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ReplyToMessageModel(id: $id)';
}


}

/// @nodoc
abstract mixin class $ReplyToMessageModelCopyWith<$Res>  {
  factory $ReplyToMessageModelCopyWith(ReplyToMessageModel value, $Res Function(ReplyToMessageModel) _then) = _$ReplyToMessageModelCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ReplyToMessageModelCopyWithImpl<$Res>
    implements $ReplyToMessageModelCopyWith<$Res> {
  _$ReplyToMessageModelCopyWithImpl(this._self, this._then);

  final ReplyToMessageModel _self;
  final $Res Function(ReplyToMessageModel) _then;

/// Create a copy of ReplyToMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReplyToMessageModel].
extension ReplyToMessageModelPatterns on ReplyToMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AvailableReplyTo value)?  available,TResult Function( DeletedReplyTo value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AvailableReplyTo() when available != null:
return available(_that);case DeletedReplyTo() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AvailableReplyTo value)  available,required TResult Function( DeletedReplyTo value)  deleted,}){
final _that = this;
switch (_that) {
case AvailableReplyTo():
return available(_that);case DeletedReplyTo():
return deleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AvailableReplyTo value)?  available,TResult? Function( DeletedReplyTo value)?  deleted,}){
final _that = this;
switch (_that) {
case AvailableReplyTo() when available != null:
return available(_that);case DeletedReplyTo() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String senderId,  String content,  ContentType contentType)?  available,TResult Function( String id)?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AvailableReplyTo() when available != null:
return available(_that.id,_that.senderId,_that.content,_that.contentType);case DeletedReplyTo() when deleted != null:
return deleted(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String senderId,  String content,  ContentType contentType)  available,required TResult Function( String id)  deleted,}) {final _that = this;
switch (_that) {
case AvailableReplyTo():
return available(_that.id,_that.senderId,_that.content,_that.contentType);case DeletedReplyTo():
return deleted(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String senderId,  String content,  ContentType contentType)?  available,TResult? Function( String id)?  deleted,}) {final _that = this;
switch (_that) {
case AvailableReplyTo() when available != null:
return available(_that.id,_that.senderId,_that.content,_that.contentType);case DeletedReplyTo() when deleted != null:
return deleted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class AvailableReplyTo implements ReplyToMessageModel {
  const AvailableReplyTo({required this.id, required this.senderId, required this.content, required this.contentType});
  

@override final  String id;
 final  String senderId;
 final  String content;
 final  ContentType contentType;

/// Create a copy of ReplyToMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableReplyToCopyWith<AvailableReplyTo> get copyWith => _$AvailableReplyToCopyWithImpl<AvailableReplyTo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableReplyTo&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,id,senderId,content,contentType);

@override
String toString() {
  return 'ReplyToMessageModel.available(id: $id, senderId: $senderId, content: $content, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class $AvailableReplyToCopyWith<$Res> implements $ReplyToMessageModelCopyWith<$Res> {
  factory $AvailableReplyToCopyWith(AvailableReplyTo value, $Res Function(AvailableReplyTo) _then) = _$AvailableReplyToCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderId, String content, ContentType contentType
});




}
/// @nodoc
class _$AvailableReplyToCopyWithImpl<$Res>
    implements $AvailableReplyToCopyWith<$Res> {
  _$AvailableReplyToCopyWithImpl(this._self, this._then);

  final AvailableReplyTo _self;
  final $Res Function(AvailableReplyTo) _then;

/// Create a copy of ReplyToMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? content = null,Object? contentType = null,}) {
  return _then(AvailableReplyTo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as ContentType,
  ));
}


}

/// @nodoc


class DeletedReplyTo implements ReplyToMessageModel {
  const DeletedReplyTo({required this.id});
  

@override final  String id;

/// Create a copy of ReplyToMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletedReplyToCopyWith<DeletedReplyTo> get copyWith => _$DeletedReplyToCopyWithImpl<DeletedReplyTo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedReplyTo&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ReplyToMessageModel.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeletedReplyToCopyWith<$Res> implements $ReplyToMessageModelCopyWith<$Res> {
  factory $DeletedReplyToCopyWith(DeletedReplyTo value, $Res Function(DeletedReplyTo) _then) = _$DeletedReplyToCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeletedReplyToCopyWithImpl<$Res>
    implements $DeletedReplyToCopyWith<$Res> {
  _$DeletedReplyToCopyWithImpl(this._self, this._then);

  final DeletedReplyTo _self;
  final $Res Function(DeletedReplyTo) _then;

/// Create a copy of ReplyToMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeletedReplyTo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
