import 'package:flutter/material.dart';

import 'package:prueba_emqu/src/utils/utils.dart';

class BannerAdds extends StatelessWidget {
  const BannerAdds({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: PageView(
        children: [
          _buildBanner(
              context: context,
              photoUrl:
                  '${kApiLoremflickr}400/300/criptocurrency?random=${generateRandomInt()}'),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/currency?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/cash?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/criptocurrency?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/currency?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/cash?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/finance?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/finance?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/currency?random=${generateRandomInt()}',
          ),
          _buildBanner(
            context: context,
            photoUrl:
                '${kApiLoremflickr}400/300/currency?random=${generateRandomInt()}',
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(
      {required BuildContext context, required String photoUrl}) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'https://www.eltiempo.com/');
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColorLight,
                blurRadius: 5.0,
                spreadRadius: 1.0,
                offset: const Offset(2.0, 10.0),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            fadeInDuration: const Duration(milliseconds: 200),
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage(photoUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
