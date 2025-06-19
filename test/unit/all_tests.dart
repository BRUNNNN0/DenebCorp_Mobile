// This file serves as a test runner for all unit tests
// You can run this file to execute all unit tests at once

// Entity Tests
import 'entities/cadastro_entity_test.dart' as cadastro_entity_test;
import 'entities/login_entity_test.dart' as login_entity_test;
import 'entities/service_entity_test.dart' as service_entity_test;
import 'entities/service_offer_entity_test.dart' as service_offer_entity_test;
import 'entities/combined_service_offer_test.dart' as combined_service_offer_test;

// Repository Tests
import 'repositories/cadastro_repository_test.dart' as cadastro_repository_test;
import 'repositories/login_repository_test.dart' as login_repository_test;
import 'repositories/buscar_repository_test.dart' as buscar_repository_test;
import 'repositories/cadastrar_servico_repository_test.dart' as cadastrar_servico_repository_test;

// DataSource Tests
import 'datasources/remote_firesource_test.dart' as remote_firesource_test;

void main() {
  // Run all entity tests
  cadastro_entity_test.main();
  login_entity_test.main();
  service_entity_test.main();
  service_offer_entity_test.main();
  combined_service_offer_test.main();

  // Run all repository tests
  cadastro_repository_test.main();
  login_repository_test.main();
  buscar_repository_test.main();
  cadastrar_servico_repository_test.main();

  // Run all datasource tests
  remote_firesource_test.main();
} 