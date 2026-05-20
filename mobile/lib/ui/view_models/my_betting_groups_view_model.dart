import 'package:flutter/material.dart';

class MyBettingGroupsViewModel extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  final List<Map<String, dynamic>> myGroups = [
    {
      'title': 'Bolão do Rodrigão',
      'creator': 'Rodrigo G.',
      'avatars': [
        'https://i.pravatar.cc/150?img=1',
        'https://i.pravatar.cc/150?img=2',
        'https://i.pravatar.cc/150?img=3',
        'https://i.pravatar.cc/150?img=4',
      ],
      'additionalCount': 38,
    },
    {
      'title': 'Bolão da Firma',
      'creator': 'Diego F.',
      'avatars': [
        'https://i.pravatar.cc/150?img=5',
        'https://i.pravatar.cc/150?img=6',
        'https://i.pravatar.cc/150?img=7',
        'https://i.pravatar.cc/150?img=8',
      ],
      'additionalCount': 3,
    },
    {
      'title': 'Família & Amigos',
      'creator': 'Joseph O.',
      'avatars': [
        'https://i.pravatar.cc/150?img=9',
        'https://i.pravatar.cc/150?img=10',
        'https://i.pravatar.cc/150?img=11',
        'https://i.pravatar.cc/150?img=12',
      ],
      'additionalCount': 0,
    },
    {
      'title': 'Um bolão recém criado',
      'creator': 'Diego F.',
      'avatars': <String>[],
      'additionalCount': 0,
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
