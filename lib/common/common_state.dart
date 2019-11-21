abstract class CommonState {
  bool loading = false;
  bool loaded = false;
  Map error;
  CommonState({
    this.loading,
    this.loaded,
    this.error,
  });
  Map<String, dynamic> toMap() => {
        'loading': loading,
        'loaded': loaded,
        'error': error,
      };
}