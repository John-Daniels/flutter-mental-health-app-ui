import 'package:flutter/material.dart';
import '../models/Excercise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  List<Exercises> excerciseList = [
    Exercises(
      title: 'Speaking Skills',
      subtitle: '16 Exercises',
      color: Colors.orange[800],
      icon: const Icon(Icons.favorite_outlined),
    ),
    Exercises(
        title: 'Reading Speed',
        subtitle: '16 Exercises',
        color: Colors.blue[500],
        icon: const Icon(Icons.person)),
    Exercises(
        title: 'Coding Skills',
        subtitle: '16 Exercises',
        color: Colors.pink[400],
        icon: const Icon(Icons.account_balance_wallet_rounded)),
    Exercises(
      title: 'Speaking Skills',
      subtitle: '16 Exercises',
      color: Colors.green[300],
      icon: const Icon(Icons.adb),
    ),
  ];

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String dateText = "${date.day} ${months[date.month - 1]}, ${date.year}";

    return Scaffold(
      backgroundColor: Colors.blue[600],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (
          context,
        ) =>
            Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 25, left: 25),
            child: Column(
              children: [
                // title
                TitleWithMoreHoriz(
                  title: 'Exercises',
                  onPressed: () {},
                  color: Colors.black,
                ),

                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: excerciseList.length,
                    itemBuilder: (context, index) {
                      Exercises e = excerciseList[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ExercisesCard(
                          icon: e.icon,
                          title: e.title,
                          subtitle: e.subtitle,
                          onSideIconTap: () {},
                          color: e.color,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, John!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          dateText,
                          style: TextStyle(
                            color: Colors.blue[100],
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 18),

                // search bar
                Container(
                  // padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // how do you feel?
                TitleWithMoreHoriz(title: 'How do you feel?', onPressed: () {}),

                const SizedBox(height: 18),

                //emoji sec

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    EmojiContainer(emoji: '😔', emotionText: 'Badly'),
                    EmojiContainer(emoji: '😊', emotionText: 'Fine'),
                    EmojiContainer(emoji: '😌', emotionText: 'Excellent'),
                    EmojiContainer(emoji: '😉', emotionText: 'Excited'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ExercisesCard extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String title;
  final String subtitle;

  final VoidCallback onSideIconTap;

  const ExercisesCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onSideIconTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.8, color: Colors.grey.shade100),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color,
              ),
              child: icon,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWithMoreHoriz(
                      title: title,
                      onPressed: onSideIconTap,
                      color: Colors.black,
                      titleFontSize: 12,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[400], fontSize: 10),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class TitleWithMoreHoriz extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback onPressed;
  final double? titleFontSize;

  const TitleWithMoreHoriz(
      {super.key,
      required this.title,
      required this.onPressed,
      this.color = Colors.white,
      this.titleFontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: color,
            fontSize: titleFontSize,
          ),
        ),

        InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onPressed,
            child: Icon(Icons.more_horiz, color: color, size: 20)),
        // IconButton(
        //   padding: const EdgeInsets.all(0),
        //   icon: Icon(Icons.more_horiz, color: color),
        //   onPressed: onPressed,
        // )
      ],
    );
  }
}

class EmojiContainer extends StatelessWidget {
  final String emoji;
  final String emotionText;
  const EmojiContainer(
      {super.key, required this.emoji, required this.emotionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue[500],
          ),
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          emotionText,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
