
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class ReferRepositoryImp implements ReferRepository{

        final ReferRemoteDataSource remoteDataSource;
        ReferRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    