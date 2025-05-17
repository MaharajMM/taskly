import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/const/resource.dart';
import 'package:taskly/shared/widget/custom_text_formfield.dart';
import 'package:taskly/shared/widget/empty_task_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabTitles = ['To-Do', 'Habit', 'Journal', 'Note'];

  final Map<int, List<String>> _categoryItems = {
    0: [], // To-Do items (empty for demonstration)
    1: [], // Habit items (empty for demonstration)
    2: [], // Journal items (empty for demonstration)
    3: [], // Note items (empty for demonstration)
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    // This ensures the UI updates when tab changes
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('E dd MMMM yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final currentTabIndex = _tabController.index;
    // Get items for current tab
    final currentItems = _categoryItems[currentTabIndex] ?? [];
    final hasItems = currentItems.isNotEmpty;

    return Scaffold(
      // backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new task functionality
        },
        backgroundColor: const Color(0xFFEA6242),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _getCurrentDate(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kBlack.withValues(alpha: 0.07),
                      blurRadius: 20,
                      spreadRadius: 8,
                    ),
                  ],
                ),
                child: CustomTextFormField(
                  borderColor: AppColors.kwhite,
                  hintText: 'Search Task',
                  name: 'search',
                  prefixIcon: SvgPicture.asset(
                    R.ASSETS_ICONS_SEARCH_SVG,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFilterChip('To-Do', 0),
                    _buildFilterChip('Habit', 1),
                    _buildFilterChip('Journal', 2),
                    _buildFilterChip('Note', 3),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.sort, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: hasItems
                    ? _buildCategoryContent(currentTabIndex, currentItems)
                    : EmptyTasksView(categoryName: _tabTitles[currentTabIndex]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryContent(int tabIndex, List<String> items) {
    // Different layouts based on the tab type
    switch (tabIndex) {
      case 0: // To-Do
        return _buildToDoList(items);
      case 1: // Habit
        return _buildHabitGrid(items);
      case 2: // Journal
        return _buildJournalList(items);
      case 3: // Note
        return _buildNoteList(items);
      default:
        return const SizedBox();
    }
  }

  Widget _buildToDoList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.check_circle_outline),
          title: Text(items[index]),
          trailing: const Icon(Icons.more_vert),
        );
      },
    );
  }

  Widget _buildHabitGrid(List<String> items) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text(items[index]),
          ),
        );
      },
    );
  }

  Widget _buildJournalList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Journal Entry ${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(items[index]),
                const SizedBox(height: 8),
                Text(
                  DateFormat('dd MMM yyyy').format(DateTime.now()),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoteList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          color: Colors.yellow[100],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(items[index]),
          ),
        );
      },
    );
  }

  Widget _buildFilterChip(String label, int index) {
    final isSelected = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.animateTo(index);
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEA6242) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
