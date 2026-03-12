// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CareerEntry {

 String get jobTitle; String get company; String get location; String get details; String get start; String get end;
/// Create a copy of CareerEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerEntryCopyWith<CareerEntry> get copyWith => _$CareerEntryCopyWithImpl<CareerEntry>(this as CareerEntry, _$identity);

  /// Serializes this CareerEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerEntry&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.company, company) || other.company == company)&&(identical(other.location, location) || other.location == location)&&(identical(other.details, details) || other.details == details)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobTitle,company,location,details,start,end);

@override
String toString() {
  return 'CareerEntry(jobTitle: $jobTitle, company: $company, location: $location, details: $details, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $CareerEntryCopyWith<$Res>  {
  factory $CareerEntryCopyWith(CareerEntry value, $Res Function(CareerEntry) _then) = _$CareerEntryCopyWithImpl;
@useResult
$Res call({
 String jobTitle, String company, String location, String details, String start, String end
});




}
/// @nodoc
class _$CareerEntryCopyWithImpl<$Res>
    implements $CareerEntryCopyWith<$Res> {
  _$CareerEntryCopyWithImpl(this._self, this._then);

  final CareerEntry _self;
  final $Res Function(CareerEntry) _then;

/// Create a copy of CareerEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobTitle = null,Object? company = null,Object? location = null,Object? details = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CareerEntry].
extension CareerEntryPatterns on CareerEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerEntry value)  $default,){
final _that = this;
switch (_that) {
case _CareerEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerEntry value)?  $default,){
final _that = this;
switch (_that) {
case _CareerEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobTitle,  String company,  String location,  String details,  String start,  String end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerEntry() when $default != null:
return $default(_that.jobTitle,_that.company,_that.location,_that.details,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobTitle,  String company,  String location,  String details,  String start,  String end)  $default,) {final _that = this;
switch (_that) {
case _CareerEntry():
return $default(_that.jobTitle,_that.company,_that.location,_that.details,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobTitle,  String company,  String location,  String details,  String start,  String end)?  $default,) {final _that = this;
switch (_that) {
case _CareerEntry() when $default != null:
return $default(_that.jobTitle,_that.company,_that.location,_that.details,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CareerEntry implements CareerEntry {
  const _CareerEntry({this.jobTitle = '', this.company = '', this.location = '', this.details = '', this.start = '', this.end = ''});
  factory _CareerEntry.fromJson(Map<String, dynamic> json) => _$CareerEntryFromJson(json);

@override@JsonKey() final  String jobTitle;
@override@JsonKey() final  String company;
@override@JsonKey() final  String location;
@override@JsonKey() final  String details;
@override@JsonKey() final  String start;
@override@JsonKey() final  String end;

/// Create a copy of CareerEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerEntryCopyWith<_CareerEntry> get copyWith => __$CareerEntryCopyWithImpl<_CareerEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerEntry&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.company, company) || other.company == company)&&(identical(other.location, location) || other.location == location)&&(identical(other.details, details) || other.details == details)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobTitle,company,location,details,start,end);

@override
String toString() {
  return 'CareerEntry(jobTitle: $jobTitle, company: $company, location: $location, details: $details, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$CareerEntryCopyWith<$Res> implements $CareerEntryCopyWith<$Res> {
  factory _$CareerEntryCopyWith(_CareerEntry value, $Res Function(_CareerEntry) _then) = __$CareerEntryCopyWithImpl;
@override @useResult
$Res call({
 String jobTitle, String company, String location, String details, String start, String end
});




}
/// @nodoc
class __$CareerEntryCopyWithImpl<$Res>
    implements _$CareerEntryCopyWith<$Res> {
  __$CareerEntryCopyWithImpl(this._self, this._then);

  final _CareerEntry _self;
  final $Res Function(_CareerEntry) _then;

/// Create a copy of CareerEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobTitle = null,Object? company = null,Object? location = null,Object? details = null,Object? start = null,Object? end = null,}) {
  return _then(_CareerEntry(
jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
