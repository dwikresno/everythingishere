import 'dart:async';

import 'package:all_is_here/ui/IG/ig_message.dart';
import 'package:all_is_here/ui/IG_modal_share_reels.dart';
import 'package:all_is_here/ui/IG_note.dart';
import 'package:all_is_here/ui/animation_walk.dart';
import 'package:all_is_here/ui/chat_gpt.dart';
import 'package:all_is_here/ui/chess_clock.dart';
import 'package:all_is_here/ui/chooseseat.dart';
import 'package:all_is_here/ui/color_blind_test.dart';
import 'package:all_is_here/ui/custom_navbar.dart';
import 'package:all_is_here/ui/daily_reward.dart';
import 'package:all_is_here/ui/dark_light_mode.dart';
import 'package:all_is_here/ui/discord_card.dart';
import 'package:all_is_here/ui/dynamic_floating.dart';
import 'package:all_is_here/ui/eyeanimation.dart';
import 'package:all_is_here/ui/facebook.dart';
import 'package:all_is_here/ui/fireworks.dart';
import 'package:all_is_here/ui/game_tap_screen.dart';
import 'package:all_is_here/ui/gojek.dart';
import 'package:all_is_here/ui/google_page.dart';
import 'package:all_is_here/ui/guess_person.dart';
import 'package:all_is_here/ui/harvestmoon.dart';
import 'package:all_is_here/ui/hide_post.dart';
import 'package:all_is_here/ui/hit_calculate.dart';
import 'package:all_is_here/ui/manage_menu_position.dart';
import 'package:all_is_here/ui/slide_animation.dart';
import 'package:all_is_here/ui/ig_flip_pp.dart';
import 'package:all_is_here/ui/instagram_topic.dart';
import 'package:all_is_here/ui/listchecked.dart';
import 'package:all_is_here/ui/love_alarm.dart';
import 'package:all_is_here/ui/navbar_gojek.dart';
import 'package:all_is_here/ui/pancake_sort.dart';
import 'package:all_is_here/ui/piano.dart';
import 'package:all_is_here/ui/pokemon.dart';
import 'package:all_is_here/ui/selected_variant.dart';
import 'package:all_is_here/ui/snake.dart';
import 'package:all_is_here/ui/snow.dart';
import 'package:all_is_here/ui/thanks_150.dart';
import 'package:all_is_here/ui/tictactoe.dart';
import 'package:all_is_here/ui/tiktok_like.dart';
import 'package:all_is_here/ui/tokopedia.dart';
import 'package:all_is_here/ui/tokopedia_top_tabbar.dart';
import 'package:all_is_here/ui/welcome_december.dart';
import 'package:all_is_here/ui/whatsapp.dart';
import 'package:all_is_here/ui/youtube.dart';
import 'package:all_is_here/ui/zelda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ScrollController scrollController = ScrollController();
  List listFeature = [
    "Eye Animation",
    "Choose Seat",
    "Snake",
    "Pokemon",
    "Piano",
    "Zelda",
    "HarvestMoon Walk",
    "Animation Walk",
    "List Checked",
    "Hide Post",
    "IG Message",
    "Pancake Sort",
    "Whatsapp",
    "Gojek Slide Panel",
    "Tokopedia",
    "Youtube",
    "Custom Navbar",
    "Select Varian Tokopedia",
    "Tiktok Like",
    "Facebook",
    "Dynamic Floating Tokopedia",
    "Instagram Topic",
    "Love Alarm",
    "Navbar Gojek",
    "IG Flip PP",
    "Thanks 150",
    "Slide Animation",
    "Welcome December",
    "Color Blind",
    "Google Page",
    "Game Tap Screen",
    "Guess Person",
    "Snow",
    "IG Note",
    "Firework",
    "IG Share Reels",
    "Discord Card Move",
    "Tic-Tac-Toe",
    "Dark Light Mode",
    "Tokopedia Top Tabbar",
    "Hit Calculate",
    "Chess Clock",
    "Daily Reward",
    "Manage Menu Position",
    "Chat GPT"
  ];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Timer(Duration(milliseconds: 200), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.search,
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Name",
              ),
              onEditingComplete: () {
                setState(() {});
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                controller: scrollController,
                // reverse: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: listFeature
                    .where((element) => element
                        .toString()
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                    .length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      movePage(searchController.text != ""
                          ? listFeature.indexWhere((element) => element
                              .toString()
                              .toLowerCase()
                              .contains(listFeature
                                  .where((element) => element
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          searchController.text.toLowerCase()))
                                  .elementAt(index)
                                  .toString()
                                  .toLowerCase()))
                          : index);
                    },
                    child: Text(
                      listFeature
                          .where((element) => element
                              .toString()
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase()))
                          .elementAt(index),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  movePage(param) {
    Widget? className;
    switch (param) {
      case 0:
        className = EyeAnimation();
        break;
      case 1:
        className = ChooseSeat();
        break;
      case 2:
        className = Snake();
        break;
      case 3:
        className = Pokemon();
        break;
      case 4:
        className = Piano();
        break;
      case 5:
        className = ZeldaPage();
        break;
      case 6:
        className = HarvestMoon();
        break;
      case 7:
        className = AnimationWalk();
        break;
      case 8:
        className = ListChecked();
        break;
      case 9:
        className = HidePost();
        break;
      case 10:
        className = IGMessage();
        break;
      case 11:
        className = PancakeSort();
        break;
      case 12:
        className = Whatsapp();
        break;
      case 13:
        className = Gojek();
        break;
      case 14:
        className = Tokopedia();
        break;
      case 15:
        className = Youtube();
        break;
      case 16:
        className = CustomNavbar();
        break;
      case 17:
        className = SelectedVariant();
        break;
      case 18:
        className = TiktokLike();
        break;
      case 19:
        className = Facebook();
        break;
      case 20:
        className = DynamicFloating();
        break;
      case 21:
        className = InstagramTopic();
        break;
      case 22:
        className = LoveAlarm();
        break;
      case 23:
        className = NavbarGojek();
        break;
      case 24:
        className = IGFlip();
        break;
      case 25:
        className = Thanks150();
        break;
      case 26:
        className = SlideAnimation();
        break;
      case 27:
        className = WelcomeDecember();
        break;
      case 28:
        className = ColorBlindTest();
        break;
      case 29:
        className = GooglePage();
        break;
      case 30:
        className = GameTapScreen();
        break;
      case 31:
        className = GuessPerson();
        break;
      case 32:
        className = Snow();
        break;
      case 33:
        className = IGNote();
        break;
      case 34:
        className = Firework();
        break;
      case 35:
        className = IGModalShareReels();
        break;
      case 36:
        className = DiscordCard();
        break;
      case 37:
        className = TicTacToe();
        break;
      case 38:
        className = DarkLightMode();
        break;
      case 39:
        className = TokopediaTopTabbar();
        break;
      case 40:
        className = HitCalculate();
        break;
      case 41:
        className = ChessClock();
        break;
      case 42:
        className = DailyReward();
        break;
      case 43:
        className = ManageMenuPosition();
        break;
      case 44:
        className = ChatGPT();
        break;
      default:
        // do something else
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => className!),
    ).then((value) => setState(() {}));
  }
}
