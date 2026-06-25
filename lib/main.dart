import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/features/auth/data/datasource/auth_datasource_impl.dart';
import 'package:mari_nail_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mari_nail_app/features/auth/domain/usecase/auth_usecase_impl.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/forgot_otp.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/enter_email.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/forgot_pwEmail.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/pw_reset_sucess.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/recreate_pw.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/sign_in_success_page.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/signin_create_account_page.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/user_info_form.dart';
import 'package:mari_nail_app/features/auth/presentation/pages/welcome_otp.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:mari_nail_app/features/home/presentation/pages/home_page.dart';
import 'package:mari_nail_app/features/home/presentation/pages/nav.dart';
import 'package:mari_nail_app/features/home/presentation/pages/recently_favourite.dart';
import 'package:mari_nail_app/features/home/presentation/pages/splah_screen.dart';
import 'package:mari_nail_app/features/home/presentation/pages/staff_page.dart';
import 'package:mari_nail_app/features/home/presentation/pages/trending_desgin.dart';
import 'package:mari_nail_app/features/home/presentation/providers/favorite_provider.dart';
import 'package:mari_nail_app/features/home/presentation/providers/home_provider.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/change-pasword_files/change_password_profile.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/change-pasword_files/change_pw_profile_otp.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/change_phone_number.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/delete_account_page.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/language_page.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/personal_info_edit.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/privacy_security.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/profile_page.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/terms_conditions.dart';
import 'package:mari_nail_app/features/services/data/datasource/categories_datasource_impl.dart';
import 'package:mari_nail_app/features/services/data/datasource/services_datasources_impl.dart';
import 'package:mari_nail_app/features/services/data/repository/categories_repo_impl.dart';
import 'package:mari_nail_app/features/services/data/repository/services_repo_impl.dart';
import 'package:mari_nail_app/features/services/domain/usecase/categories_usecase_impl.dart';
import 'package:mari_nail_app/features/services/domain/usecase/services_usecase_impl.dart';
import 'package:mari_nail_app/features/services/presentation/pages/services_page.dart';
import 'package:mari_nail_app/features/services/presentation/providers/booking_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final httpCustomer = http.Client();
  runApp(
    MyApp(sharedPreferences: sharedPreferences, httpCustomer: httpCustomer),
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final http.Client httpCustomer;

  const MyApp({
    super.key,
    required this.sharedPreferences,
    required this.httpCustomer,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // auth provider
        ChangeNotifierProvider<AuthProvider>(
          create: (_) {
            final authDataSourceImpl = AuthDataSourceImpl(
              customHttp: httpCustomer,
              sharedPreferences: sharedPreferences,
            );

            final repositoryImpl = AuthRepositoryImpl(
              authDataSource: authDataSourceImpl,
            );

            final useCaseImpl = AuthUsecaseImpl(authRepository: repositoryImpl);
            return AuthProvider(authUseCase: useCaseImpl);
          },
        ),

        ChangeNotifierProvider<BookingProvider>(
          create: (_) {
            final categoriesDataSourceImpl = CategoriesDatasourceImpl(
              customHttp: httpCustomer,
              sharedPreferences: sharedPreferences,
            );

            final categoriesRepoImpl = CategoriesRepoImpl(
              categoriesDatasource: categoriesDataSourceImpl,
            );

            final categoriesUsecaseImpl = CategoriesUsecaseImpl(
              categoriesRepo: categoriesRepoImpl,
            );
            final servicesDatasourceImpl = ServicesDatasourcesImpl(
              customHttp: httpCustomer,
              sharedPreferences: sharedPreferences,
            );
            final servicesRepoImpl = ServicesRepoImpl(
              servicesDatasource: servicesDatasourceImpl,
            );
            final servicesUsecaseImpl = ServicesUsecaseImpl(
              servicesRepo: servicesRepoImpl,
            );
            return BookingProvider(
              categoriesUsecase: categoriesUsecaseImpl,
              servicesUsecase: servicesUsecaseImpl,
            );
          },
        ),

        // provider for favorite state management
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        color: AppColors.backgroundBG,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.fredokaTextTheme(),
          useMaterial3: false,
        ),
        initialRoute: Routes.splashScreen,
        routes: {
          Routes.signinCreateAccountPage: (_) => SigninCreateAccountPage(),
          Routes.splashScreen: (_) => SplashScreen(),
          Routes.homePage: (_) => HomePage(),
          Routes.profilePage: (_) => ProfilePage(),
          Routes.servicesPage: (_) => ServicesPage(),
          Routes.signInSuccessPage: (_) => SignInSuccessPage(),
          Routes.welcomeOtp: (_) => WelcomeOtp(),
          Routes.forgotPwemail: (_) => ForgotPwemail(),
          Routes.forgotOtp: (_) => ForgotOtp(),
          Routes.recreatePw: (_) => RecreatePw(),
          Routes.pwResetSucess: (_) => PwResetSucess(),
          Routes.userInfoForm: (_) => UserInfoForm(),
          Routes.trendingDesign: (_) => TrendingDesgin(),
          Routes.recentlyFavourite: (_) => RecentlyFavourite(),
          Routes.enterEmail: (_) => EnterEmail(),
          Routes.languagePage: (_) => LanguagePage(),
          Routes.deleteAccountPage: (_) => DeleteAccountPage(),
          Routes.changePasswordProfile: (_) => ChangePasswordProfile(),
          Routes.changePwProfileOtp: (_) => ChangePwProfileOtp(),
          Routes.changePhoneNumber: (_) => ChangePhoneNumber(),
          Routes.personalInfoEdit: (_) => PersonalInfoEdit(),
          Routes.termsConditions: (_) => TermsConditions(),
          Routes.privacySecurity: (_) => PrivacySecurity(),
          Routes.staffPage: (_) => StaffPage(),
          Routes.nav: (_) => Nav(),
        },
      ),
    );
  }
}
