class Routes {
  // Static data

  //#region
  /// (01) Login
  static const login = (path: '/login', name: 'login');

  /// (02) User list
  static const userListIndex = 0;
  static const userList = 'users';
  static const userListPath = '/$userList';
  static const userModify = 'userModify';
  static const userModifyPath = 'modify/:userId';
  static const userModifyFullPath = '$userListPath/modify/:userId';

  /// (03) Settings
  static const settingsIndex = 1;
  static const settingsName = 'settings';
  static const settingsPath = '/$settingsName';
  static const settings = (path: settingsPath, name: settingsName);
  //#endregion
}
