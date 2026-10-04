import 'package:compassly/core/domain/entities/location_data.dart';
import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/peer_status.dart';

class ConnectionData {
  final Member member;
  final PeerStatus status;
  final LocationData? locationData;

  ConnectionData copyWith({
    Member? member,
    PeerStatus? status,
    LocationData? locationData,
  }) {
    return ConnectionData(
      member: member ?? this.member,
      status: status ?? this.status,
      locationData: locationData ?? this.locationData,
    );
  }

  const ConnectionData({
    required this.member,
    required this.status,
    required this.locationData,
  });
}
