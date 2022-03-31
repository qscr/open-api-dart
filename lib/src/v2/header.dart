import 'package:conduit_codable_fork/conduit_codable.dart';
import 'package:conduit_open_api_fork/src/v2/property.dart';
import 'package:conduit_open_api_fork/src/v2/types.dart';

/// Represents a header in the OpenAPI specification.
class APIHeader extends APIProperty {
  APIHeader();

  String? description;
  APIProperty? items;

  @override
  void decode(KeyedArchive json) {
    super.decode(json);
    description = json.decode("description");
    if (type == APIType.array) {
      items = json.decodeObject("items", () => APIProperty());
    }
  }

  @override
  void encode(KeyedArchive json) {
    super.encode(json);
    json.encode("description", description);
    if (type == APIType.array) {
      json.encodeObject("items", items);
    }
  }
}
