abstract class ServiceBase<T extends Object> {
  static final Map<Type, Object> _instances = <Type, Object>{};

  static T getInstance<T extends Object>(T Function() factory) {
    final existing = _instances[T];
    if (existing != null) {
      return existing as T;
    }

    final instance = factory();
    _instances[T] = instance;
    return instance;
  }
}
