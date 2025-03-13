// Mocks generated by Mockito 5.4.5 from annotations
// in breizh_blok_mobile/test/services/tracking/tracking_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mixpanel_flutter/mixpanel_flutter.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePeople_0 extends _i1.SmartFake implements _i2.People {
  _FakePeople_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMixpanelGroup_1 extends _i1.SmartFake implements _i2.MixpanelGroup {
  _FakeMixpanelGroup_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [Mixpanel].
///
/// See the documentation for Mockito's code generation for more information.
class MockMixpanel extends _i1.Mock implements _i2.Mixpanel {
  @override
  void setServerURL(String? serverURL) => super.noSuchMethod(
    Invocation.method(#setServerURL, [serverURL]),
    returnValueForMissingStub: null,
  );

  @override
  void setLoggingEnabled(bool? loggingEnabled) => super.noSuchMethod(
    Invocation.method(#setLoggingEnabled, [loggingEnabled]),
    returnValueForMissingStub: null,
  );

  @override
  void setUseIpAddressForGeolocation(bool? useIpAddressForGeolocation) =>
      super.noSuchMethod(
        Invocation.method(#setUseIpAddressForGeolocation, [
          useIpAddressForGeolocation,
        ]),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<bool?> hasOptedOutTracking() =>
      (super.noSuchMethod(
            Invocation.method(#hasOptedOutTracking, []),
            returnValue: _i3.Future<bool?>.value(),
            returnValueForMissingStub: _i3.Future<bool?>.value(),
          )
          as _i3.Future<bool?>);

  @override
  void optInTracking() => super.noSuchMethod(
    Invocation.method(#optInTracking, []),
    returnValueForMissingStub: null,
  );

  @override
  void optOutTracking() => super.noSuchMethod(
    Invocation.method(#optOutTracking, []),
    returnValueForMissingStub: null,
  );

  @override
  void setFlushBatchSize(int? flushBatchSize) => super.noSuchMethod(
    Invocation.method(#setFlushBatchSize, [flushBatchSize]),
    returnValueForMissingStub: null,
  );

  @override
  _i3.Future<void> identify(String? distinctId) =>
      (super.noSuchMethod(
            Invocation.method(#identify, [distinctId]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  void alias(String? alias, String? distinctId) => super.noSuchMethod(
    Invocation.method(#alias, [alias, distinctId]),
    returnValueForMissingStub: null,
  );

  @override
  _i3.Future<void> track(
    String? eventName, {
    Map<String, dynamic>? properties,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#track, [eventName], {#properties: properties}),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i2.People getPeople() =>
      (super.noSuchMethod(
            Invocation.method(#getPeople, []),
            returnValue: _FakePeople_0(this, Invocation.method(#getPeople, [])),
            returnValueForMissingStub: _FakePeople_0(
              this,
              Invocation.method(#getPeople, []),
            ),
          )
          as _i2.People);

  @override
  _i3.Future<void> trackWithGroups(
    String? eventName,
    Map<String, dynamic>? properties,
    Map<String, dynamic>? groups,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#trackWithGroups, [
              eventName,
              properties,
              groups,
            ]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  void setGroup(String? groupKey, dynamic groupID) => super.noSuchMethod(
    Invocation.method(#setGroup, [groupKey, groupID]),
    returnValueForMissingStub: null,
  );

  @override
  _i2.MixpanelGroup getGroup(String? groupKey, dynamic groupID) =>
      (super.noSuchMethod(
            Invocation.method(#getGroup, [groupKey, groupID]),
            returnValue: _FakeMixpanelGroup_1(
              this,
              Invocation.method(#getGroup, [groupKey, groupID]),
            ),
            returnValueForMissingStub: _FakeMixpanelGroup_1(
              this,
              Invocation.method(#getGroup, [groupKey, groupID]),
            ),
          )
          as _i2.MixpanelGroup);

  @override
  void addGroup(String? groupKey, dynamic groupID) => super.noSuchMethod(
    Invocation.method(#addGroup, [groupKey, groupID]),
    returnValueForMissingStub: null,
  );

  @override
  void removeGroup(String? groupKey, dynamic groupID) => super.noSuchMethod(
    Invocation.method(#removeGroup, [groupKey, groupID]),
    returnValueForMissingStub: null,
  );

  @override
  void deleteGroup(String? groupKey, dynamic groupID) => super.noSuchMethod(
    Invocation.method(#deleteGroup, [groupKey, groupID]),
    returnValueForMissingStub: null,
  );

  @override
  _i3.Future<void> registerSuperProperties(Map<String, dynamic>? properties) =>
      (super.noSuchMethod(
            Invocation.method(#registerSuperProperties, [properties]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<void> registerSuperPropertiesOnce(
    Map<String, dynamic>? properties,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#registerSuperPropertiesOnce, [properties]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<void> unregisterSuperProperty(String? propertyName) =>
      (super.noSuchMethod(
            Invocation.method(#unregisterSuperProperty, [propertyName]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<Map<dynamic, dynamic>?> getSuperProperties() =>
      (super.noSuchMethod(
            Invocation.method(#getSuperProperties, []),
            returnValue: _i3.Future<Map<dynamic, dynamic>?>.value(),
            returnValueForMissingStub:
                _i3.Future<Map<dynamic, dynamic>?>.value(),
          )
          as _i3.Future<Map<dynamic, dynamic>?>);

  @override
  _i3.Future<void> clearSuperProperties() =>
      (super.noSuchMethod(
            Invocation.method(#clearSuperProperties, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  void timeEvent(String? eventName) => super.noSuchMethod(
    Invocation.method(#timeEvent, [eventName]),
    returnValueForMissingStub: null,
  );

  @override
  _i3.Future<double?> eventElapsedTime(String? eventName) =>
      (super.noSuchMethod(
            Invocation.method(#eventElapsedTime, [eventName]),
            returnValue: _i3.Future<double?>.value(),
            returnValueForMissingStub: _i3.Future<double?>.value(),
          )
          as _i3.Future<double?>);

  @override
  _i3.Future<void> reset() =>
      (super.noSuchMethod(
            Invocation.method(#reset, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<String> getDistinctId() =>
      (super.noSuchMethod(
            Invocation.method(#getDistinctId, []),
            returnValue: _i3.Future<String>.value(
              _i4.dummyValue<String>(
                this,
                Invocation.method(#getDistinctId, []),
              ),
            ),
            returnValueForMissingStub: _i3.Future<String>.value(
              _i4.dummyValue<String>(
                this,
                Invocation.method(#getDistinctId, []),
              ),
            ),
          )
          as _i3.Future<String>);

  @override
  _i3.Future<void> flush() =>
      (super.noSuchMethod(
            Invocation.method(#flush, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);
}
