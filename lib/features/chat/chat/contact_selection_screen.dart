import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/widgets/modern_contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as contacts;
import 'package:matrix/matrix.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:bmp/shared/utils/snackbar.dart';

class ModernContactSelectionScreen extends StatefulWidget {
  final Room room;

  const ModernContactSelectionScreen({
    required this.room,
    super.key,
  });

  @override
  State<ModernContactSelectionScreen> createState() => _ModernContactSelectionScreenState();
}

class _ModernContactSelectionScreenState extends State<ModernContactSelectionScreen>
    with TickerProviderStateMixin {
  List<contacts.Contact> deviceContacts = [];
  List<contacts.Contact> filteredContacts = [];
  Set<String> selectedContacts = {};
  bool isLoading = true;
  bool permissionDenied = false;
  bool isSearching = false;
  bool isSending = false;
  
  final TextEditingController searchController = TextEditingController();
  late AnimationController _fabAnimationController;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _loadContacts();
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Future<void> _loadContacts() async {
    try {
      var status = await Permission.contacts.status;
      if (!status.isGranted) {
        status = await Permission.contacts.request();
      }

      if (status.isGranted) {
        final fetchedContacts = await contacts.FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
        );
        
        final validContacts = fetchedContacts
            .where((c) => c.phones.isNotEmpty && c.displayName.isNotEmpty)
            .toList()
          ..sort((a, b) => a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()));

        setState(() {
          deviceContacts = validContacts;
          filteredContacts = validContacts;
          isLoading = false;
        });
      } else {
        setState(() {
          permissionDenied = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        permissionDenied = true;
      });
    }
  }

  void _filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredContacts = deviceContacts;
      } else {
        filteredContacts = deviceContacts.where((contact) {
          return contact.displayName.toLowerCase().contains(query.toLowerCase()) ||
                 contact.phones.any((phone) => phone.number.contains(query));
        }).toList();
      }
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
    });
    
    if (!isSearching) {
      searchController.clear();
      _filterContacts('');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.colorScheme.onSurface,
        title: isSearching
            ? TextField(
                controller: searchController,
                autofocus: true,
                onChanged: _filterContacts,
                decoration: InputDecoration(
    hintText: L10n.of(context).searchContacts,
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 18,
                ),
              )
            :  Text(L10n.of(context).shareContact)
,
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: isLoading
          ? AppLoadingWidget()
          : permissionDenied
              ? _buildPermissionDeniedView(theme)
              : _buildContactsList(theme),
      floatingActionButton: selectedContacts.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: isSending ? null : _sendSelectedContacts,
              backgroundColor: theme.colorScheme.primary,
              icon: isSending 
                  ? AppLoadingWidget()
                  : const Icon(Icons.send),
label: Text(L10n.of(context).sendCount(selectedContacts.length)),
            )
          : null,
    );
  }

  Widget _buildPermissionDeniedView(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.contacts,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
                L10n.of(context).accessYourContacts,

              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
  L10n.of(context).contactsPermissionMessage,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () async {
                final status = await Permission.contacts.status;
                if (status.isPermanentlyDenied) {
                  openAppSettings();
                } else {
                  setState(() {
                    isLoading = true;
                    permissionDenied = false;
                  });
                  _loadContacts();
                }
              },
              child: Text(L10n.of(context).grantPermission,
),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactsList(ThemeData theme) {
    if (filteredContacts.isEmpty) {
      return  Center(
        child: Text(L10n.of(context).noContactsFound),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredContacts.length,
      itemBuilder: (context, index) {
        final contact = filteredContacts[index];
        final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
        final contactId = '${contact.displayName}_$phone';
        final isSelected = selectedContacts.contains(contactId);
        
        return ModernContactCard(
          name: contact.displayName,
          phoneNumber: phone,
          avatarUrl: contact.photo != null
              ? 'data:image/png;base64,${contact.photo}'
              : null,
          isSelected: isSelected,
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedContacts.remove(contactId);
                if (selectedContacts.isEmpty) {
                  _fabAnimationController.reverse();
                }
              } else {
                selectedContacts.add(contactId);
                if (selectedContacts.length == 1) {
                  _fabAnimationController.forward();
                }
              }
            });
          },
        );
      },
    );
  }

  Future<void> _sendSelectedContacts() async {
    setState(() {
      isSending = true;
    });

    try {
      final selectedContactObjects = filteredContacts.where((contact) {
        final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
        final contactId = '${contact.displayName}_$phone';
        return selectedContacts.contains(contactId);
      }).toList();

      for (final contact in selectedContactObjects) {
        final phone = contact.phones.isNotEmpty ? contact.phones.first.number : 'No phone';
        final contactText = '${contact.displayName}\n$phone';
        
        await widget.room.sendTextEvent(contactText);
      }

      if (mounted) {
        CustomSnackbar.show(
          context,
          message: '${selectedContacts.length} contact(s) sent successfully',
          type: SnackbarType.success,
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        CustomSnackbar.show(
          context,
          message: 'Failed to send contacts: $e',
          type: SnackbarType.error,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isSending = false;
        });
      }
    }
  }
}