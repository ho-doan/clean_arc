import 'package:apps_flyer/apps_flyer.dart';
import 'package:clean_arc/pages/app/cubit/app_cubit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base/text_filed.dart';
import '../../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppCubit get appCubit => context.read<AppCubit>();
  @override
  void initState() {
    super.initState();
    _startAppsFlyer();
  }

  _startAppsFlyer() async {
    final check = await AppsFlyer.instance.hasInit();
    if (!check) throw Exception('AppsFlyer is not init');
    await AppsFlyer.instance.init(appFlyerToken);
    await AppsFlyer.instance.enableDebugLog();
    await AppsFlyer.instance.start(appFlyerToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_sharp,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.purpleAccent,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (ctx, state) {
          final userName = (state is AppSuccess ? state : null)?.userName;
          final controller = TextEditingController(text: userName);
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextInputWidgetBase(
                        controller: controller,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (controller.text.isEmpty) return;
                        appCubit.onUpdateUserName(controller.text);
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (state is AppSuccess)
                for (final point in List.from(state.points)
                    .sorted((a, b) => int.parse(b).compareTo(int.parse(a))))
                  Card(
                    child: Container(
                      color: Colors.grey.withOpacity(.7),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Point',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
                                text: ': ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: point,
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
