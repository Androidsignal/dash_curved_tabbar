import 'package:flutter/material.dart';

/// Defines the position of the icon relative to the tab text.
enum IconPosition { left, right, top, bottom }

/// Defines the position of the curved edges within the tab bar.
enum TabBarPosition { left, right, center, none }

/// A customizable curved tab bar widget for Flutter.
///
/// This widget supports:
/// - Curved selection background
/// - Icons and text with customizable positions
/// - Optional badge counts
/// - Animated selection changes
/// - Optional tab content area below the bar
class DashCurvedTabBar extends StatelessWidget {
  /// The list of tab labels.
  final List<String> tabs;

  /// Optional icons to display alongside each tab.
  final List<Widget>? icons;

  /// Optional badge counts for each tab.
  final List<int>? badgeCountList;

  /// Padding inside the tab bar container.
  final EdgeInsetsGeometry? tabPadding;

  /// Margin around the tab bar container.
  final EdgeInsetsGeometry? tabMargin;

  /// The index of the currently selected tab.
  final int selectedIndex;

  /// Callback triggered when a tab is tapped.
  final ValueChanged<int> onTap;

  /// Height of the tab bar.
  final double tabBarHeight;

  /// Border radius of the tab bar background.
  final double? tabBarBorderRadius;

  /// Background color of the selected tab.
  final Color selectedTabColor;

  /// Text style for the selected tab label.
  final TextStyle? selectedTabTextStyle;

  /// Text style for unselected tab labels.
  final TextStyle? unselectedTabTextStyle;

  /// Duration of the selection animation.
  final Duration animationDuration;

  /// Position of the icon relative to the text.
  final IconPosition iconPosition;

  /// Whether to hide the tab text and show only icons.
  final bool hideTabText;

  /// Optional content widgets displayed below the tab bar.
  final List<Widget>? tabContent;

  /// Padding for the tab content container.
  final EdgeInsetsGeometry? tabContentPadding;

  /// Background color for the badge indicator.
  final Color badgeColor;

  /// Diameter of the badge circle.
  final double badgeSize;

  /// Text style used inside the badge.
  final TextStyle? badgeTextStyle;

  /// Offset applied to the badge position.
  final Offset badgeOffset;

  /// Whether to show a divider below the tab bar.
  final bool showDivider;

  /// Whether to hide the outer borders of the tab bar.
  final bool hideBorders;

  /// Height of the divider below the tab bar.
  final double? dividerHeight;

  /// Color of the divider below the tab bar.
  final Color? dividerColor;

  /// Background color of the tab content container.
  final Color? tabContentColor;

  /// Creates a [DashCurvedTabBar].
  const DashCurvedTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
    this.icons,
    this.tabBarHeight = 60,
    this.tabBarBorderRadius,
    this.selectedTabColor = Colors.grey,
    this.selectedTabTextStyle,
    this.unselectedTabTextStyle,
    this.tabPadding,
    this.tabMargin,
    this.animationDuration = const Duration(milliseconds: 250),
    this.iconPosition = IconPosition.left,
    this.hideTabText = false,
    this.tabContent,
    this.tabContentPadding,
    this.badgeCountList,
    this.badgeColor = Colors.blueAccent,
    this.badgeSize = 16,
    this.badgeTextStyle,
    this.showDivider = false,
    this.hideBorders = false,
    this.badgeOffset = const Offset(-8, -15),
    this.dividerHeight,
    this.dividerColor,
    this.tabContentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: tabMargin ?? const EdgeInsets.all(16),
      padding: tabPadding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(tabBarBorderRadius ?? 20),
        border: hideBorders
            ? null
            : Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final text = entry.value;
              final isSelected = index == selectedIndex;
              final icon = icons != null ? icons![index] : null;
              final badgeCount =
                  badgeCountList != null ? badgeCountList![index] : 0;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      AnimatedContainer(
                        duration: animationDuration,
                        height: tabBarHeight,
                        decoration: ShapeDecoration(
                          color: isSelected
                              ? selectedTabColor
                              : Colors.transparent,
                          shape: _CurvedShape(
                            borderRadius: tabBarBorderRadius ?? 12,
                            curvePosition: index == 0
                                ? TabBarPosition.right
                                : index == tabs.length - 1
                                    ? TabBarPosition.left
                                    : TabBarPosition.center,
                            isSelected: isSelected,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: icon != null
                            ? buildContent(text, icon, isSelected)
                            : Text(
                                text,
                                textAlign: TextAlign.center,
                                style: isSelected
                                    ? (selectedTabTextStyle ??
                                        const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                                    : (unselectedTabTextStyle ??
                                        const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12)),
                              ),
                      ),

                      // Badge
                      if (badgeCount > 0)
                        Positioned(
                          right: badgeOffset.dx,
                          top: badgeOffset.dy,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            constraints: BoxConstraints(
                              minWidth: badgeSize,
                              minHeight: badgeSize,
                            ),
                            decoration: BoxDecoration(
                              color: badgeColor,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              badgeCount.toString(),
                              style: badgeTextStyle ??
                                  const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          // Divider
          if (showDivider)
            Container(
              height: dividerHeight ?? 2,
              color: dividerColor ?? Colors.grey.shade300,
            ),

          // Content for the selected tab
          if (tabContent != null && tabContent!.isNotEmpty)
            Transform.translate(
              offset: const Offset(0, -1),
              child: Container(
                key: ValueKey<int>(selectedIndex),
                width: double.infinity,
                padding: tabContentPadding ?? const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: tabContentColor ?? Colors.grey,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(tabBarBorderRadius ?? 20),
                  ),
                ),
                child: tabContent![selectedIndex],
              ),
            ),
        ],
      ),
    );
  }

  /// Builds the content for a tab by combining icon and text
  /// based on the [iconPosition] and [hideTabText] properties.
  Widget buildContent(String text, Widget icon, bool isSelected) {
    final textWidget = hideTabText
        ? const SizedBox.shrink()
        : Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: isSelected
                  ? (selectedTabTextStyle ??
                      const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))
                  : (unselectedTabTextStyle ??
                      const TextStyle(color: Colors.black87, fontSize: 12)),
            ),
          );

    switch (iconPosition) {
      case IconPosition.left:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            if (!hideTabText) const SizedBox(width: 6),
            textWidget
          ],
        );
      case IconPosition.right:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget,
            if (!hideTabText) const SizedBox(width: 6),
            icon
          ],
        );
      case IconPosition.top:
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            if (!hideTabText) const SizedBox(height: 4),
            textWidget
          ],
        );
      case IconPosition.bottom:
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget,
            if (!hideTabText) const SizedBox(height: 4),
            icon
          ],
        );
    }
  }
}

/// Custom shape used for drawing curved tabs.
class _CurvedShape extends ShapeBorder {
  /// Whether the tab is currently selected.
  final bool isSelected;

  /// Border radius applied to the top corners.
  final double borderRadius;

  /// Position of the curved edge in the tab bar.
  final TabBarPosition curvePosition;

  /// Creates a [_CurvedShape] for the curved tab bar.
  const _CurvedShape({
    this.isSelected = false,
    this.borderRadius = 10,
    this.curvePosition = TabBarPosition.none,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRect(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();

    if (isSelected) {
      path.addRRect(RRect.fromRectAndCorners(
        rect,
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
        bottomLeft: const Radius.circular(0),
        bottomRight: const Radius.circular(0),
      ));

      switch (curvePosition) {
        case TabBarPosition.right:
          path
            ..moveTo(rect.bottomRight.dx, rect.bottomRight.dy)
            ..relativeLineTo(30, 0)
            ..quadraticBezierTo(rect.bottomRight.dx, rect.bottomRight.dy,
                rect.centerRight.dx, rect.centerRight.dy)
            ..close();
          break;
        case TabBarPosition.left:
          path
            ..moveTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
            ..relativeLineTo(-30, 0)
            ..quadraticBezierTo(rect.bottomLeft.dx, rect.bottomLeft.dy,
                rect.centerLeft.dx, rect.centerLeft.dy)
            ..close();
          break;
        case TabBarPosition.center:
          path
            ..moveTo(rect.bottomRight.dx, rect.bottomRight.dy)
            ..relativeLineTo(30, 0)
            ..quadraticBezierTo(rect.bottomRight.dx, rect.bottomRight.dy,
                rect.centerRight.dx, rect.centerRight.dy)
            ..moveTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
            ..relativeLineTo(-30, 0)
            ..quadraticBezierTo(rect.bottomLeft.dx, rect.bottomLeft.dy,
                rect.centerLeft.dx, rect.centerLeft.dy)
            ..close();
          break;
        case TabBarPosition.none:
          break;
      }
    } else {
      path.addRect(rect);
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
