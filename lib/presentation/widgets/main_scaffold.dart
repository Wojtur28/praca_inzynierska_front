import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final bool isAdmin;
  final VoidCallback onLogout;
  final ValueChanged<ThemeMode> onThemeChange;
  final ThemeMode currentTheme;
  final String appBarTitle;
  final Widget? leading;

  const MainScaffold({
    super.key,
    required this.body,
    required this.isAdmin,
    required this.onLogout,
    required this.onThemeChange,
    required this.currentTheme,
    required this.appBarTitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: leading,
        actions: [
          IconButton(
            icon: Icon(
              currentTheme == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
              color: Colors.white,
            ),
            onPressed: () {
              onThemeChange(
                currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
              );
            },
            tooltip: 'Przełącz motyw',
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Wylogowanie'),
                  content: const Text('Czy na pewno chcesz się wylogować?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Anuluj'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Wyloguj'),
                    ),
                  ],
                ),
              );
              if (confirmed == true) {
                onLogout();
              }
            },
            tooltip: 'Wyloguj się',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.videogame_asset, color: Colors.deepPurple),
              title: const Text('Gry'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/games');
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books, color: Colors.deepPurple),
              title: const Text('Biblioteka'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/library');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.deepPurple),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart, color: Colors.deepPurple),
              title: const Text('Raporty'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/reports');
              },
            ),
            if (isAdmin)
              ListTile(
                leading: const Icon(Icons.admin_panel_settings, color: Colors.deepPurple),
                title: const Text('Admin'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              ),
          ],
        ),
      ),
      body: body,
    );
  }
}
