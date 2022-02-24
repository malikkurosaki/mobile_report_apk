class Config{
  static const isDevAndroid = false;
  static const isDevWeb = true;
  static const weblUrl = 'http://localhost:3000/apiv2';
  static const androidUrl = 'http://10.0.2.2:3000/apiv2';
  static const serverUrl = 'https://188.166.218.138:3000/apiv2';
  static const getUrl = isDevAndroid? androidUrl : isDevWeb? weblUrl : serverUrl;
}