// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferenceEntry {

 String get name; String get jobTitle; String get company; String get email; String get phone;
/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceEntryCopyWith<ReferenceEntry> get copyWith => _$ReferenceEntryCopyWithImpl<ReferenceEntry>(this as ReferenceEntry, _$identity);

  /// Serializes this ReferenceEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.company, company) || other.company == company)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,jobTitle,company,email,phone);

@override
String toString() {
  return 'ReferenceEntry(name: $name, jobTitle: $jobTitle, company: $company, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $ReferenceEntryCopyWith<$Res>  {
  factory $ReferenceEntryCopyWith(ReferenceEntry value, $Res Function(ReferenceEntry) _then) = _$ReferenceEntryCopyWithImpl;
@useResult
$Res call({
 String name, String jobTitle, String company, String email, String phone
});




}
/// @nodoc
class _$ReferenceEntryCopyWithImpl<$Res>
    implements $ReferenceEntryCopyWith<$Res> {
  _$ReferenceEntryCopyWithImpl(this._self, this._then);

  final ReferenceEntry _self;
  final $Res Function(ReferenceEntry) _then;

/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? jobTitle = null,Object? company = null,Object? email = null,Object? phone = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferenceEntry].
extension ReferenceEntryPatterns on ReferenceEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceEntry value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceEntry():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String jobTitle,  String company,  String email,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
return $default(_that.name,_that.jobTitle,_that.company,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String jobTitle,  String company,  String email,  String phone)  $default,) {final _that = this;
switch (_that) {
case _ReferenceEntry():
return $default(_that.name,_that.jobTitle,_that.company,_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String jobTitle,  String company,  String email,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceEntry() when $default != null:
return $default(_that.name,_that.jobTitle,_that.company,_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferenceEntry implements ReferenceEntry {
  const _ReferenceEntry({this.name = '', this.jobTitle = '', this.company = '', this.email = '', this.phone = ''});
  factory _ReferenceEntry.fromJson(Map<String, dynamic> json) => _$ReferenceEntryFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String jobTitle;
@override@JsonKey() final  String company;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;

/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceEntryCopyWith<_ReferenceEntry> get copyWith => __$ReferenceEntryCopyWithImpl<_ReferenceEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferenceEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.company, company) || other.company == company)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,jobTitle,company,email,phone);

@override
String toString() {
  return 'ReferenceEntry(name: $name, jobTitle: $jobTitle, company: $company, email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ReferenceEntryCopyWith<$Res> implements $ReferenceEntryCopyWith<$Res> {
  factory _$ReferenceEntryCopyWith(_ReferenceEntry value, $Res Function(_ReferenceEntry) _then) = __$ReferenceEntryCopyWithImpl;
@override @useResult
$Res call({
 String name, String jobTitle, String company, String email, String phone
});




}
/// @nodoc
class __$ReferenceEntryCopyWithImpl<$Res>
    implements _$ReferenceEntryCopyWith<$Res> {
  __$ReferenceEntryCopyWithImpl(this._self, this._then);

  final _ReferenceEntry _self;
  final $Res Function(_ReferenceEntry) _then;

/// Create a copy of ReferenceEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? jobTitle = null,Object? company = null,Object? email = null,Object? phone = null,}) {
  return _then(_ReferenceEntry(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
