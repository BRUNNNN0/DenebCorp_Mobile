# i_pet

A new Flutter project.


Projeto APP I_pet, 

Tela incial, ja funcional com Login e Cadastro, Integração com Login via Google será incluída em uma segunda versão:
![Tela_Inicial](https://github.com/user-attachments/assets/969a08d3-e113-4472-a8ac-74cd93e7142a)

Tela de Login, ja funcionando com a API:
![Tela_Login](https://github.com/user-attachments/assets/3da44730-aee0-4921-bb3d-2e45f2aa6bf4)

Tela de Cadastro, ja funcionando com a API:
![Tela_de_cadastro](https://github.com/user-attachments/assets/f803bb5c-ed6e-48f2-9684-3566f5277d09)

Tela de Perfil, ja funcionando com a API:
![Tela_perfil](https://github.com/user-attachments/assets/98dbd061-6575-4e5d-94c5-d425893dba3f)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Como rodar o projeto DenebCorp Mobile

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
