import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import '../../../generated/assets.dart';
import '../../resources/app_colors.dart';
import '../styles.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final double? borderRadius;
  final void Function(String?)? onChange;
  final String? value;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? prefix;

  const CustomDropDown({
    super.key,
    required this.items,
    this.hint = '',
    this.borderRadius = 16,
    this.onChange,
    this.value,
    this.validator,
    this.label,
    this.prefix,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late TextEditingController searchController;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    selectedValue = widget.value;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _openSearchDialog(BuildContext context) async {
    String? result = await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        List<String> filtered = List.from(widget.items);

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'ابحث...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          filtered = widget.items
                              .where((e) =>
                                  e.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    10.ph,
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filtered[index]),
                            onTap: () =>
                                Navigator.pop(context, filtered[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (result != null) {
      setState(() => selectedValue = result);
      widget.onChange?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: Styles.textStyle16SemiBold(context)),
          6.ph,
        ],
        GestureDetector(
          onTap: () => _openSearchDialog(context),
          child: AbsorbPointer(
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: selectedValue,
              validator: widget.validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                prefixIcon: widget.prefix,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                focusedBorder: buildOutlineInputBorder(),
                enabledBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
                disabledBorder: buildOutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(widget.borderRadius!.r),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.all(6.r),
                child: SvgPicture.asset(Assets.svgArrowDown, width: 14.w),
              ),
              items: widget.items
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e, overflow: TextOverflow.ellipsis),
                      ))
                  .toList(),
              onChanged: (_) {},
              hint: Text(
                widget.hint,
                style: Styles.textStyle16Medium(context).copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.secondaryColor),
      borderRadius: BorderRadius.circular(widget.borderRadius!.r),
    );
  }
}
