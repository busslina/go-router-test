class Routes {
  // Static data

  //#region
  /// (01) Login
  static const login = (path: '/login', name: 'login');

  /// (02) User list
  static const userListIndex = 0;
  static const userListName = 'userList';
  static const userListPath = '/$userListName';
  static const userList = (path: userListPath, name: userListName);

  /// (03) Settings
  static const userSettingsIndex = 1;
  static const settingsName = 'settings';
  static const settingsPath = '/$settingsName';
  static const settings = (path: settingsPath, name: settingsName);
  //#endregion
}
