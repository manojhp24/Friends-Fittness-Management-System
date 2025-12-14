class MainNavState {
  final int index;

  const MainNavState({this.index = 0});

  MainNavState copyWith({int? index}) {
    return MainNavState(index: index ?? this.index);
  }
}
