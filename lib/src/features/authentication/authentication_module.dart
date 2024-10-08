import 'package:ca_flutter_test/src/features/authentication/data/datasources/create_account_ds.dart';
import 'package:ca_flutter_test/src/features/authentication/data/datasources/delete_account_ds.dart';
import 'package:ca_flutter_test/src/features/authentication/data/datasources/login_ds.dart';
import 'package:ca_flutter_test/src/features/authentication/data/repositories/auth_repository.dart';
import 'package:ca_flutter_test/src/features/authentication/data/services/auth_service.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/datasources/i_create_account_ds.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/datasources/i_delete_account_ds.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/datasources/i_login_ds.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/entities/auth_state_entity.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/repositories/i_auth_repository.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/services/i_auth_service.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/usecases/create_account_uc.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/usecases/delete_account_uc.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/usecases/login_uc.dart';
import 'package:ca_flutter_test/src/features/authentication/interactor/usecases/update_auth_state_uc.dart';
import 'package:ca_flutter_test/src/features/authentication/ui/pages/user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import '../../core/routes/routes.dart';
import 'ui/pages/login.dart';
import 'ui/pages/sign_up.dart';

//* -------------------------------------------------------------------------------
//* ---------------------------- AUTHENTICATION MODULE ----------------------------
//* -------------------------------------------------------------------------------
class AuthenticationModule extends Module {
  @override
  //* --- MODULE IMPORTS ---
  List<Module> get imports => [
        // --- CORE MODULE ---
        CoreModule(),

        // --- IMPORTED MODULES ---

        // ...
      ];

  //* --- MODULE ONLY BINDS ---
  @override
  void binds(Injector i) {
    // Data Sources
    i.add<ICreateAccountDataSource>(CreateAccountDataSource.new);
    i.add<IDeleteAccountDataSource>(DeleteAccountDataSource.new);
    i.add<ILoginDataSource>(LoginDataSource.new);

    // Repositories
    i.add<IAuthRepository>(AuthRepository.new);

    // Use Cases
    i.add(CreateAccountUseCase.new);
    i.add(DeleteAccountUseCase.new);
    i.add(LoginUseCase.new);
    i.add(UpdateAuthStateUseCase.new);

    // Controller
    i.addSingleton<IAuthService>(
      () => AuthService(
        state: AuthStateEntity.initial(),
        createAccountUseCase: i.get(),
        deleteAccountUseCase: i.get(),
        loginUseCase: i.get(),
        updateAuthStateUseCase: i.get(),
      ),
    );
  }

  //* --- EXPORTED BINDS ---
  @override
  void exportedBinds(Injector i) {
    // ...
  }

  //* --- ROUTES ---
  @override
  void routes(RouteManager r) {
    // --- MAIN ROUTE ---
    r.child(
      '/',
      child: (context) {
        return const SignUpPage();
      },
      transition: TransitionType.rightToLeft,
    );

    // --- LOGIN ---
    r.child(
      const Routes().login,
      child: (context) {
        return const LoginPage();
      },
      transition: TransitionType.fadeIn,
    );

    // --- USER PAGE ---
    r.child(
      const Routes().userPage,
      child: (context) {
        return const UserPage();
      },
      transition: TransitionType.fadeIn,
    );
  }
}
