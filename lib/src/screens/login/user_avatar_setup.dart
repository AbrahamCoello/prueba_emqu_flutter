import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_emqu/src/bloc/session/session_bloc.dart';
import 'package:prueba_emqu/src/models/user.dart';
import 'package:prueba_emqu/src/ui/ui.dart';
import 'package:prueba_emqu/src/utils/constants.dart';

class UserAvatarSetup extends StatelessWidget {
  const UserAvatarSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Stack(
        children: [
          _buildAvatar(),
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        _showBottomSheetModal(context);
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.add)),
                ),
              ))
        ],
      )),
    );
  }

  Widget _buildAvatar() {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        final photoUrl = state.session?.user?.avatarUrl ??
            'https://www.w3schools.com/howto/img_avatar.png';
        return UserAvatar(
          imageUrl: photoUrl,
        );
      },
    );
  }

  _showBottomSheetModal(BuildContext context) {
    final SessionBloc sessionBloc = context.read<SessionBloc>();
    List<Widget> children = [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Text('Selecciona un avatar',
              style: Theme.of(context).textTheme.headlineSmall)),
      GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: kNameAvatar.map((avatar) {
            final url = kApiMultiAvatar +
                avatar['avatarName'] +
                kApiMultiAvatarExtension;
            return GestureDetector(
              onTap: () {
                sessionBloc.add(SetSessionEvent(
                    sessionBloc.state.session!
                        .copyWith(
                            user:
                                sessionBloc.state.session?.user != null
                                    ? sessionBloc.state.session!.user!.copyWith(
                                        avatarUrl: url,
                                        fullName: avatar['fullName'])
                                    : UserModel(
                                        avatarUrl: url,
                                        fullName: avatar['fullName']))));
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: UserAvatar(
                  imageUrl: url,
                ),
              ),
            );
          }).toList()),
    ];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Necesario si se usa isScrollControlled en true y se usa el widget ModalBottomSheetCustom en el retorno del builder
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ModalBottomSheetCustom(children: children);
      },
    );
  }
}
