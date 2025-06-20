import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  bool isForward = false;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Use a realistic duration
    );

    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.easeOutExpo);

    animation = Tween<double>(begin: 0, end: 150).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  final List<Map<String, String>> deals = const [
    {
      'image':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/40432/scorpio-n-exterior-right-front-three-quarter-77.avif?auto=compress&w=400',
      'title': 'Mahindra Scorpio N',
      'discount': 'Rs 3,500 OFF',
    },
    {
      'image':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/139585/harrier-ev-exterior-right-front-three-quarter-18.jpeg?auto=compress&w=400',
      'title': 'Tata Harrier EV',
      'discount': 'Rs 4,000 OFF',
    },
    {
      'image':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/106815/creta-exterior-right-front-three-quarter-5.jpeg?auto=compress&w=400',
      'title': 'Hyundai Creta',
      'discount': 'Rs 3,000 OFF',
    },
  ];

  final List<Map<String, String>> trending = const [
    {
      'image':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/171777/kylaq-exterior-right-front-three-quarter-4.jpeg?auto=compress&w=400',
      'title': 'Skoda Kylaq',
      'discount': 'Rs 3,500 OFF',
    },
    {
      'image':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/124839/thar-roxx-exterior-right-front-three-quarter-25.jpeg?auto=compress&w=400',
      'title': 'Mahindra Thar Roxx',
      'discount': 'Rs 3,500 OFF',
    },
    {
      'image':
          'https://imgd.aeplcdn.com/664x374/n/cw/ec/175183/new-5-series-exterior-right-front-three-quarter.jpeg?auto=compress&w=400',
      'title': 'BMW 5 Series',
      'discount': 'Rs 3,500 OFF',
    },
  ];

  final List<Map<String, dynamic>> brands = const [
    {'icon': Icons.directions_car, 'name': 'Perodua'},
    {'icon': Icons.directions_car, 'name': 'Honda'},
    {'icon': Icons.directions_car, 'name': 'Toyota'},
    {'icon': Icons.directions_car, 'name': 'Proton'},
    {'icon': Icons.directions_car, 'name': 'Nissan'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211F24),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'VAN',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFD69C39),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 1.5,
                              ),
                            ),
                            TextSpan(
                              text: 'TURE',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFD69C39),
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 50,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: Stack(
                    children: [
                      // The animated input always extends right up to the icon
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: AnimatedContainer(
                          width: animation.value > 50 ? animation.value : 0,
                          height: 50,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.centerLeft,
                          child: animation.value > 50
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 13, right: 60),
                                  child: TextField(
                                    cursorColor: Colors.white12,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      // The icon stays fixed at the right and overlaps the input's right edge
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                              if (!isForward) {
                                animController.forward();
                                isForward = true;
                              } else {
                                animController.reverse();
                                isForward = false;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
            12, 8, 12, 80), // enough padding for nav bar
        children: [
          sectionTitle('Deals'),
          const SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: deals.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                return carCard(deals[index]);
              },
            ),
          ),
          const SizedBox(height: 18),
          sectionTitle('Explore Cars for You'),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                filterChip('Under RS 30,000', true),
                filterChip('RS 30,000 - 50,000', false),
                filterChip('RS 50,000 - 100,000', false),
                filterChip('> RS 100,000', false),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: brands
                .map((brand) => brandButton(brand['icon'], brand['name']))
                .toList(),
          ),
          const SizedBox(height: 24),
          sectionTitle('Trending Cars in India'),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                return carCard(trending[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF2D2C30),
        selectedItemColor: const Color(0xFFD69C39),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (idx) {
          setState(() {
            _currentIndex = idx;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Browse cars',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget carCard(Map<String, String> car) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF26242B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              car['image']!,
              width: 200,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              car['title']!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              car['discount']!,
              style: GoogleFonts.poppins(
                color: const Color(0xFFD69C39),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterChip(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFD69C39) : const Color(0xFF26242B),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: selected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget brandButton(IconData icon, String name) {
    return Column(
      children: [
        Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
            color: const Color(0xFF26242B),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: const Color(0xFFD69C39), size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
