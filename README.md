# Flutter Quiz Application Project
- 플러터로 구현한 퀴즈 어플리케이션
## 2023-09-09 init
- 2023-09-20 ver1 배포(파이어베이스 호스팅)

## 세팅
- `dart pub global activate flutterfire_cli`
- `firebase login`
- `flutterfire configure --project=flutter-quiz-3e78b`
- `flutter pub add firebase_core`
- `flutter pub add firebase_auth`

## 파이어 베이스 배포
1. `firebase init`
2. Hosting: Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys 선택
3. `Use an exising project` 선택
4. 파이어베이스에 만들어둔 프로젝트 선택
5. What do you want to use as your public directory? public
6. Configure as a single-page app (rewrite all urls to /index.html)? Yes
7. Set up automatic builds and deploys with GitHub? No
8. `firebase.json` 에서 `"public": "public"` 을 `"public": "build/web"` 으로 수정
9. `flutter build web`
10. `firebase deploy`

## apk 파일 생성
- `flutter build apk --release --target-platform=android-arm64`
- `build/app/outputs/apk/relase/app-relase.apk`

### 빌드시에 Dex 오류 발생하는 경우
 - project / android / app / build.gradle 파일을 찾는다
 - 파일에서 defaultConfig 항목을 찾는다. multiDexEnabled true 추가
```xml
defaultConfig {
  versionName flutterVersionName
  multiDexEnabled true
}
```
### firebase hosting url
- https://flutter-quiz-3e78b-66ac4.web.app/
