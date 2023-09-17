# Flutter Quiz Application Project
- 플러터로 구현한 퀴즈 어플리케이션
## 2023-09-09 init

## dependencies
- `dart pub global activate flutterfire_cli`
- `firebase login`
- `flutterfire configure --project=flutter-quiz-ef599`
- `flutter pub add firebase_core`
- `flutter pub add firebase_auth`

### 배포시 Dex 오류 발생하는 경우
 - project / android / app / build.gradle 파일을 찾는다
 - 파일에서 defaultConfig 항목을 찾는다. multiDexEnabled true 추가
```xml
defaultConfig {
  versionName flutterVersionName
  multiDexEnabled true
}
```
