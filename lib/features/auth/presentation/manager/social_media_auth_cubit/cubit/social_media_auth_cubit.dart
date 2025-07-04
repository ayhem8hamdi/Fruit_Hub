import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'social_media_auth_state.dart';

class SocialMediaAuthCubit extends Cubit<SocialMediaAuthState> {
  SocialMediaAuthCubit() : super(SocialMediaAuthInitial());
}
