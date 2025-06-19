# MiAujuda

## Pré-requisitos
- [Flutter](https://flutter.dev/docs/get-started/install) instalado (recomenda-se a versão estável mais recente)
- [Dart](https://dart.dev/get-dart) instalado (geralmente já incluso no Flutter)
- Android Studio, VS Code ou outro editor compatível
- Emulador Android/iOS ou dispositivo físico

## Instalação de dependências

No terminal, execute:
```bash
flutter pub get
```

## Rodando o app em um emulador ou dispositivo

1. Conecte um dispositivo físico ou inicie um emulador Android/iOS
2. No terminal, execute:
```bash
flutter run
```

## Rodando testes unitários

Para rodar todos os testes unitários:
```bash
flutter test test/unit/all_tests.dart
```

Ou rode testes individuais conforme necessário:
```bash
flutter test test/unit/<caminho_do_teste>.dart
```

## Observações
- Certifique-se de que o arquivo `google-services.json` (Android) e/ou `GoogleService-Info.plist` (iOS) estejam corretamente configurados para builds com Firebase.
- Para builds web, use:
```bash
flutter run -d chrome
```
- Para builds desktop, use:
```bash
flutter run -d windows # ou macos/linux
```
