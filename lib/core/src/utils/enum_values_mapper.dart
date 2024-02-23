abstract class EnumValuesMapper {
  static List<T?> withNull<T>(List<T> values) {
    return <T?>[null, ...values];
  }
}
