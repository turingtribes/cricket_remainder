import 'package:cricket_remainder/bala_floder/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Appbars extends StatelessWidget {
  const Appbars({
    super.key,
    required this.title,
    this.enableLogo = false,
    this.enableBack = false,
    this.enableSearch = false,
    this.enableNotification = false,
    this.enableCoins = false,
    this.enableInfo = false,
    this.enableSettings = false,
    this.coins = 0,
  });

  final String title;
  final bool enableLogo;
  final bool enableBack;
  final bool enableSearch;
  final bool enableNotification;
  final bool enableCoins;
  final bool enableInfo;
  final bool enableSettings;
  final int coins;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: dark,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade500, // border color
              width: 1, // border thickness
            ),
          ),
        ),

        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Row(
              children: [
                enableBack
                    ? IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios, color: light),
                      )
                    : enableLogo
                    ? Image.asset('assets/logo.jpeg', height: 35, width: 35)
                    : const SizedBox(width: 48),

                const SizedBox(width: 8),

                Text(
                  title,
                  style: TextStyle(
                    color: light,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const Spacer(),

                if (enableSearch)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: light),
                  ),

                if (enableNotification)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none, color: light),
                  ),

                if (enableCoins)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: light),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.monetization_on_outlined, color: light),
                        const SizedBox(width: 5),
                        Text(
                          '$coins',
                          style: TextStyle(
                            color: light,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                if (enableInfo)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.info_outline, color: light),
                  ),

                if (enableSettings)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: light),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
