import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:matrix/matrix.dart' hide Contact;
import 'package:permission_handler/permission_handler.dart';

class ContactContent extends StatefulWidget {
  final Function() onContactSelected;
  final Room room;
  
  const ContactContent({super.key, required this.onContactSelected, required this.room});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> with TickerProviderStateMixin {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  Set<String> selectedContacts = {};
  bool _hasPermission = false;
  bool _isLoading = false;
  bool isSending = false;
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _fabAnimationController;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _checkPermission();
    _searchController.addListener(_filterContacts);
  }

  Future<void> _checkPermission() async {
    final status = await Permission.contacts.status;
    setState(() {
      _hasPermission = status.isGranted;
    });
    if (_hasPermission) {
      _loadContacts();
    }
  }

  Future<void> _requestPermission() async {
    final status = await Permission.contacts.request();
    setState(() {
      _hasPermission = status.isGranted;
    });
    if (_hasPermission) {
      _loadContacts();
    }
  }

  Future<void> _loadContacts() async {
    setState(() => _isLoading = true);
    try {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        _contacts = contacts;
        _filteredContacts = contacts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _filterContacts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _contacts.where((contact) {
        return contact.displayName.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _selectContact(Contact contact) {
    final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
    final contactId = '${contact.displayName}_$phone';
    final isSelected = selectedContacts.contains(contactId);
    
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
  }

  Future<void> _sendSelectedContacts() async {
    setState(() {
      isSending = true;
    });

    try {
      final selectedContactObjects = _filteredContacts.where((contact) {
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
        setState(() {
          selectedContacts.clear();
        });
        widget.onContactSelected();
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: context.screenHeight * 0.4275,
                padding: EdgeInsets.all(context.screenWidth * 0.015),
                decoration: ShapeDecoration(
                  color: const Color(0x33858188),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
                  ),
                ),
                child: Column(
              children: [
                if (!_hasPermission) ...[
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.contacts, size: 64, color: Colors.white54),
                          const SizedBox(height: 16),
                          Text(
                            L10n.of(context).contactsAccessRequired,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _requestPermission,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7E24F9),
                            ),
                            child: Text(L10n.of(context).grantPermission),
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: L10n.of(context).searchContacts,
                        hintStyle: const TextStyle(color: Colors.white54),
                        prefixIcon: const Icon(Icons.search, color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xFF282130),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  
                  // Contacts list
                  Expanded(
                    child: _isLoading
                        ? AppLoadingWidget()
                        : _filteredContacts.isEmpty
                            ? Center(
                                child: Text(
                                  L10n.of(context).noContactsFound,
                                  style: const TextStyle(color: Colors.white54),
                                ),
                              )
                            : ListView.builder(
                                itemCount: _filteredContacts.length,
                                itemBuilder: (context, index) {
                                  final contact = _filteredContacts[index];
                                  final phone = contact.phones.isNotEmpty ? contact.phones.first.number : '';
                                  final contactId = '${contact.displayName}_$phone';
                                  final isSelected = selectedContacts.contains(contactId);
                                  
                                  return Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () => _selectContact(contact),
                                      borderRadius: BorderRadius.circular(12),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: isSelected 
                                              ? const Color(0xFF7E24F9).withOpacity(0.3)
                                              : const Color(0xFF131016),
                                          borderRadius: BorderRadius.circular(12),
                                          border: isSelected 
                                              ? Border.all(
                                                  color: const Color(0xFF7E24F9), 
                                                  width: 1.5,
                                                )
                                              : null,
                                        ),
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                const CircleAvatar(
                                                  radius: 24,
                                                  backgroundColor: Color(0xFF7E24F9),
                                                  child: Icon(
                                                    Icons.person_rounded,
                                                    color: Colors.white,
                                                    size: 28,
                                                  ),
                                                ),
                                                if (isSelected)
                                                  Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xFF7E24F9),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        Icons.check_rounded,
                                                        size: 10,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    contact.displayName,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  if (contact.phones.isNotEmpty)
                                                    const SizedBox(height: 4),
                                                  if (contact.phones.isNotEmpty)
                                                    Text(
                                                      contact.phones.first.number,
                                                      style: const TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                  ),
                ],
              ],
                ),
              ),
              if (selectedContacts.isNotEmpty)
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton.extended(
                    onPressed: isSending ? null : _sendSelectedContacts,
                    backgroundColor: const Color(0xFF7E24F9),
                    icon: isSending 
                        ? AppLoadingWidget()
                        : const Icon(Icons.send, color: Colors.white, size: 20),
                    label: Text(
'${L10n.of(context).send} (${selectedContacts.length})',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}