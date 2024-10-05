class IriParser {
  static String id(String iri) {
    return Uri.parse(iri).pathSegments.last;
  }
}
