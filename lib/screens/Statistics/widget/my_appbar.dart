import'../imports.dart';
class MyAppbar extends StatefulWidget implements PreferredSizeWidget{
  const MyAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor: Mycolors.backgroundColor,
        centerTitle: true,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1E1E2D),
                borderRadius: BorderRadius.circular(400),
              ),
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.9,
                        maxChildSize: 0.95,
                        minChildSize: 0.4,
                        builder: (context, scrollController) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color(0xff1E1E2D),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            child: const Mycard(
                              showFormInitially: true,
                            ), // ✅ هنا يتم عرض الكارد والفورم
                          );
                        },
                      );
                    },
                  );
                },
                icon: const Icon(Icons.add, size: 30),
              ),
            ),
          ),
        ],
      );
  }
}