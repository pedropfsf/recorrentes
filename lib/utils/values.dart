dynamic returnIfNull<Value, FinalValue>(Value value, FinalValue finalValue) {
  if (value is String) return value.isEmpty ? finalValue : value;
  if (value is num) return value == 0 ? finalValue : value;
  if (value is bool) return value ? finalValue : value;
  if (value == null) return finalValue;
  return value;
}
