
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class Settings_profileRepositoryImp implements Settings_profileRepository{

        final Settings_profileRemoteDataSource remoteDataSource;
        Settings_profileRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    