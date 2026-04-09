import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateRangePickerWidget extends StatefulWidget {
  final String initialText;
  final Function(DateTime startDate, DateTime endDate)? onDateRangeSelected;

  const DateRangePickerWidget({
    super.key,
    required this.initialText,
    this.onDateRangeSelected,
  });

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  String displayText = '';

  @override
  void initState() {
    super.initState();
    displayText = widget.initialText;
  }

  Future<void> _showDateRangePicker() async {
    DateTime? startDate;
    DateTime? endDate;

    try {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          final DateTime now = DateTime.now();
          final DateTime today = DateTime(now.year, now.month, now.day);
          DateTime tempStartDate = DateTime(today.year, today.month, today.day - 90);
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                backgroundColor: const Color(0xFF222C37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: EdgeInsets.all(context.screenWidth * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        L10n.of(context).selectStartDate,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.025),
                      Container(
                        height: context.screenHeight * 0.25,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: tempStartDate,
                          minimumDate: DateTime(today.year, today.month, today.day - 365),
                          onDateTimeChanged: (DateTime date) {
                            tempStartDate = DateTime(date.year, date.month, date.day);
                          },
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              L10n.of(context).cancel,
                              style: TextStyle(
                                color: const Color(0xFFD2D4E5),
                                fontSize: context.screenWidth * 0.035,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              startDate = tempStartDate;
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3976F8),
                            ),
                            child: Text(
                              L10n.of(context).next,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.screenWidth * 0.035,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      debugPrint('Error in start date picker: $e');
      return;
    }

    if (startDate != null) {
      try {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            // Calculate safe initial end date (startDate now has exactly 00:00:00 time)
            DateTime tempEndDate = DateTime(startDate!.year, startDate!.month, startDate!.day + 7);
            if (tempEndDate.isBefore(startDate!)) {
              tempEndDate = startDate!;
            }
            String? validationError;
            return StatefulBuilder(
              builder: (context, setState) {
                return Dialog(
                  backgroundColor: const Color(0xFF222C37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(context.screenWidth * 0.05),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          L10n.of(context).selectEndDate,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.0125),
                        Text(
                          '${L10n.of(context).start}: ${_formatDate(startDate!)}',
                          style: TextStyle(
                            color: const Color(0xFFD2D4E5),
                            fontSize: context.screenWidth * 0.035,
                          ),
                        ),
                        if (validationError != null) ...[
                          SizedBox(height: context.screenHeight * 0.01),
                          Text(
                            validationError!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: context.screenWidth * 0.03,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        SizedBox(height: context.screenHeight * 0.025),
                        Container(
                          height: context.screenHeight * 0.25,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: tempEndDate,
                            minimumDate: startDate!, // allow selecting the same day
                            onDateTimeChanged: (DateTime date) {
                              setState(() {
                                tempEndDate = DateTime(date.year, date.month, date.day);
                                validationError = _validateDateRange(startDate!, tempEndDate);
                              });
                            },
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                L10n.of(context).cancel,
                                style: TextStyle(
                                  color: const Color(0xFFD2D4E5),
                                  fontSize: context.screenWidth * 0.035,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: validationError == null
                                  ? () {
                                endDate = tempEndDate;
                                Navigator.of(context).pop();
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3976F8),
                                disabledBackgroundColor: Colors.grey,
                              ),
                              child: Text(
                                L10n.of(context).select,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.screenWidth * 0.035,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      } catch (e) {
        debugPrint('Error in end date picker: $e');
        return;
      }

      if (endDate != null) {
        setState(() {
          displayText = _formatDateRange(startDate!, endDate!);
        });
        widget.onDateRangeSelected?.call(startDate!, endDate!);
      }
    }
  }

  String? _validateDateRange(DateTime start, DateTime end) {
    if (end.isBefore(start)) {
      return 'End date cannot be before start date';
    }

    final monthsDiff = (end.year - start.year) * 12 + (end.month - start.month);
    if (monthsDiff > 12) {
      return 'Maximum range is 12 months';
    }

    return null;
  }

  String _formatDateRange(DateTime start, DateTime end) {
    if (start.year == end.year && start.month == end.month && start.day == end.day) {
      return _formatDate(start);
    }

    if (start.year == end.year) {
      return '${_getMonthName(start.month)} – ${_getMonthName(end.month)} ${start.year}';
    }

    return '${_getMonthName(start.month)} ${start.year} – ${_getMonthName(end.month)} ${end.year}';
  }

  String _getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDateRangePicker,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.percentWidth * 4,
          vertical: context.percentHeight * 0.5,
        ),
        decoration: ShapeDecoration(
          color: const Color(0xFF3976F8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.percentWidth * 5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              displayText,
              style: TextStyle(
                color: const Color(0xFFD2D4E5),
                fontSize: context.screenWidth * 0.03,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: context.percentWidth * 2.5),
            Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFFD2D4E5),
              size: context.screenWidth * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}

