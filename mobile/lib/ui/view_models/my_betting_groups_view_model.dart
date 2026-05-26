import 'package:flutter/material.dart';
import 'package:mobile/services/betting_group_service.dart';

class MyBettingGroupsViewModel extends ChangeNotifier {
  final BettingGroupService _bettingGroupService = BettingGroupService();

  final TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  List<Map<String, dynamic>> _allGroups = [];
  List<Map<String, dynamic>> myGroups = [];

  MyBettingGroupsViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadUserGroups();
    });
  }

  Future<void> loadUserGroups() async {
    isLoading = true;
    notifyListeners();
    final apiGroups = await _bettingGroupService.getUserBettingGroups();
    if (apiGroups != null) {
      _allGroups = apiGroups
          .where((g) => g != null)
          .map(_mapSingleGroup)
          .toList();
      myGroups = List.from(_allGroups);
    }
    isLoading = false;
    notifyListeners();
  }

  Map<String, dynamic> _mapSingleGroup(dynamic group) {
    final List<dynamic> participants = group['participants'] ?? [];
    return {
      'id': group['id'],
      'code': group['code'] ?? group['id'],
      'title': group['name'] ?? '',
      'creator': group['creator']?['name'] ?? 'Criador',
      'avatars': _extractAvatars(participants),
      'additionalCount': participants.length > 4 ? participants.length - 4 : 0,
    };
  }

  List<String> _extractAvatars(List<dynamic> participants) {
    return participants
        .where((p) => p != null && p['user'] != null)
        .take(4)
        .map((p) => _getUserAvatar(p['user']))
        .toList();
  }

  String _getUserAvatar(dynamic user) {
    final image = user['image'] as String?;
    if (image != null && image.isNotEmpty) {
      return image;
    }
    final name = user['name'] ?? 'User';
    return 'initials:${_getInitials(name)}:$name';
  }

  Future<void> searchBettingGroups(GlobalKey<FormState> formKey) async {
    if (searchController.text.trim().isEmpty) {
      myGroups = List.from(_allGroups);
      notifyListeners();
      return;
    }
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    final query = searchController.text.toLowerCase().trim();
    myGroups = _allGroups
        .where(
          (group) => group['title'].toString().toLowerCase().contains(query),
        )
        .toList();

    isLoading = false;
    notifyListeners();
  }

  String _getInitials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.isEmpty || words[0].isEmpty) {
      return '';
    }
    if (words.length == 1) {
      return words[0][0].toUpperCase();
    }
    return (words[0][0] + words[words.length - 1][0]).toUpperCase();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
