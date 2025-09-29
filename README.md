
[![DashStackPoster](https://github.com/user-attachments/assets/89ec20a1-c644-43b1-8092-17851962511b)](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8?pvs=143)

# Dash Curved TabBar

A customizable curved tab bar widget for Flutter with icons, badges, and smooth animations. 

Features curved selection, icon placement, badge notifications, and fully customizable styles.

## ✨ Features
🎨 Curved Tab Bar with animated selection.

🔢 Badges Support (unread count, notifications, etc).

📱 Icons & Text (position left, right, top, bottom).

⚡ Smooth AnimatedContainer transitions.

🔗 Connected Tab Content (shows below the selected tab).

🛠️ Customizable Styling (colors, border radius, text styles).

➕ Divider option between tabs & content.

## How to use it ?

### 1. Add dependency
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  dash_curved_tab_bar: <latest_version>
```  

### 2. Install it You can install packages from the command line: 

with pub :
```
$ pub get
```
with Flutter : 
```
$ flutter pub get
```
### 3. Import it

Now in your `Dart` code, you can use :

```
import 'package:dash_curved_tab_bar/dash_curved_tab_bar.dart';
```

### 4. Use it

Sample app demonstrates how simple the usage of the library actually is.

Using Dash Curved TabBar in your project is super simple.

You just need to add the widget with an amount and currency type, and it will handle formatting for you.

### 🎨 Customization Options 

| Parameter                | Type                | Default         | Description                                 |
| ------------------------ | ------------------- | --------------- | ------------------------------------------- |
| `tabs`                   | `List<String>`      | required        | List of tab titles                          |
| `icons`                  | `List<Widget>?`     | `null`          | Optional tab icons                          |
| `selectedIndex`          | `int`               | required        | Currently selected tab index                |
| `onTap`                  | `ValueChanged<int>` | required        | Callback when tab is tapped                 |
| `tabBarHeight`           | `double`            | `60`            | Height of tab bar                           |
| `tabBarBorderRadius`     | `double?`           | `20`            | Border radius for curved tabs               |
| `selectedTabColor`       | `Color`             | `Colors.grey`   | Background color of selected tab            |
| `selectedTabTextStyle`   | `TextStyle?`        | bold, white     | Style for selected tab text                 |
| `unselectedTabTextStyle` | `TextStyle?`        | black87         | Style for unselected tab text               |
| `iconPosition`           | `IconPosition`      | `left`          | Position of icon (left, right, top, bottom) |
| `hideTabText`            | `bool`              | `false`         | Whether to hide tab text                    |
| `badgeCountList`         | `List<int>?`        | `null`          | Badge counts per tab                        |
| `badgeColor`             | `Color`             | `blueAccent`    | Badge background color                      |
| `badgeSize`              | `double`            | `16`            | Badge size                                  |
| `badgeTextStyle`         | `TextStyle?`        | white, bold     | Badge text style                            |
| `badgeOffset`            | `Offset`            | `(-8, -15)`     | Badge position                              |
| `tabContent`             | `List<Widget>?`     | `null`          | Content widgets for each tab                |
| `tabContentColor`        | `Color?`            | `grey`          | Background color for content                |
| `showDivider`            | `bool`              | `false`         | Show divider line                           |
| `dividerHeight`          | `double?`           | `2`             | Divider thickness                           |
| `dividerColor`           | `Color?`            | `grey.shade300` | Divider color                               |
| `hideBorders`            | `bool`              | `false`         | Hide tab bar borders                        |


## How to usage?

### withOut Any Customization

```
int selectedIndex = 0;

DashCurvedTabBar(
  tabs: ["Products", "Details", "Features"],
  selectedIndex: selectedIndex,
  onTap: (i) => setState(() => selectedIndex = i),
)

```
![no anycustomiztion](https://github.com/user-attachments/assets/4b8b0643-109e-47ac-b0ce-91b15709f3d7)

### Icon Customization

* Add icons for each tab. You can also choose the icon position relative to the text (top, bottom, left, right).

* Changes Selected-UnSelected Icon color,Size, all customiztion as accoring your needs.    
```
DashCurvedTabBar(
  /// tabs label
  tabs: ["Products", "Details", "Features"],
  /// tabs icon
  icons: [
    Icon(Icons.shopping_bag, color: selectedIndex == 0 ? Colors.white : Colors.blue),
    Icon(Icons.info, color: selectedIndex == 1 ? Colors.white : Colors.black),
    Icon(Icons.star, color: selectedIndex == 2 ? Colors.white : Colors.black),
  ],
  /// selected tab index
  selectedIndex: selectedIndex,
  /// add icon position (top,bottom,right,left)
  iconPosition: IconPosition.top,
  onTap: (i) => setState(() => selectedIndex = i),
  hideBorders: true,
)
```
![no anycustomiztion](https://github.com/user-attachments/assets/6ad9d882-4ed4-43fd-9d38-d344f5867244)

### Badge Customization

* Add badges, custom colors, and selected tab styling. Perfect for real-world apps showing notifications or counts.

```
DashCurvedTabBar(
  tabs: ["Products", "Details", "Features"],
    icons: [
    Icon(Icons.shopping_bag, color: selectedIndex == 0 ? Colors.white : Colors.blue),
    Icon(Icons.info, color: selectedIndex == 1 ? Colors.white : Colors.black),
    Icon(Icons.star, color: selectedIndex == 2 ? Colors.white : Colors.black),
  ],
  badgeCountList: [3, 0, 5],
  badgeColor: Colors.red,
  badgeTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  selectedTabColor: Colors.grey,
  selectedIndex: selectedIndex,
  onTap: (i) => setState(() => selectedIndex = i),
  hideBorders: false,
)
```
![badge custom](https://github.com/user-attachments/assets/49bfe3fc-208b-452b-b048-72d547cac17e)

### Add Tabcontent for all customization

`dash_curved_tabBar` is designed to be highly flexible so you can create beautiful, interactive tab bars for your Flutter app. Here’s what you can customize:

* Tabs & Labels – Set your own tab names with any text you like.

* Icons – Add icons to tabs and choose their position (top, bottom, left, right).

* Badges – Display numeric indicators on tabs for notifications or alerts.

* Tab Colors – Customize the selected and unselected tab colors.

* Tab Text Style – Control font, size, weight, and color for both selected and unselected tabs.

* Tab Bar Height & Shape – Adjust height and rounded corners for modern UI.

* Hide Tab Text – Show only icons for a cleaner look.

* Divider – Add or remove a separator between the tab bar and content.

* Connected Content – Show content below the tab bar that updates when switching tabs.

* Badge Style – Control badge size, color, position, and text style.

```
child: DashCurvedTabBar(
          // Required: the visible tab labels.
          tabs: ["Products", "Details", "Features"],

          // Currently selected tab index.
          selectedIndex: selectedIndex,

          // Called when a tab is tapped.
          onTap: (i) => setState(() => selectedIndex = i),

          // Icons for each tab.their color is set here based on selectedIndex.
          icons: [
            Icon(
              Icons.shopping_bag,
              color: selectedIndex == 0 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.info,
              color: selectedIndex == 1 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.shopping_cart_rounded,
              color: selectedIndex == 2 ? Colors.white : Colors.black,
            ),
          ],

          // Where the icon is placed relative to the text label (top,bottom,left,right)
          iconPosition: IconPosition.top,

          // Styling for selected tab text (used only if hideTabText == false)
          selectedTabTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),

          // Styling for unselected tab text (used only if hideTabText == false)
          unselectedTabTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),

          // Hide outer border around the whole tab bar container
          hideBorders: true,

          // If true, tab labels (text) are hidden and only icons are shown
          hideTabText: true,

          // Whether to show a thin divider line between the tab bar and tab content
          showDivider: true,

          // Height of the tab bar (controls tap area too)
          tabBarHeight: 60,

          // Content widgets displayed below the tab bar (connected tab content).
          // The content at index i corresponds to tabs[i].
          tabContent: [
            Center(
              child: Text(
               "Check out our latest collection of products. "
                "High-quality items at amazing prices. "
                "Scroll down to explore our popular picks!",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Our products are designed with quality, durability, and style in mind. Each item undergoes strict quality checks to ensure premium performance and long-lasting satisfaction. Explore the main features below to understand what makes our products stand out in the market.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Features Page',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        );
```
## 📸 Examples

| All Customization | Icon Customization | Badge Customization |
|------------------|------------------|-------------------|
| ![all](https://github.com/user-attachments/assets/a71e780c-bdff-425a-9e2d-19facb8b77f5) | ![icon](https://github.com/user-attachments/assets/dd43eb97-2162-4ba8-8a57-8c058bdd0054) | ![badge](https://github.com/user-attachments/assets/a6c9574f-a446-45c3-ad8d-0b57cf4e0107) |

# Bugs and Feedback 
We welcome and appreciate any suggestions you may have for improvement.
For bugs, questions, and discussions please use the [GitHub Issues](https://github.com/Androidsignal/dash_curved_tabbar/issues).

# Acknowledgments 
It extends Flutter’s foundation to provide a ready-to-use, customizable currency formatter widget.While Flutter and intl provide the base, `dash_curved_tabBar` simplifies the process by combining widgets and formatting logic into a single package you can drop into any app.
 
# Contribution 
The DashStack team enthusiastically welcomes contributions and project participation!
There are a bunch of things you can do if you want to contribute!
The Contributor Guide has all the information you need for everything from reporting bugs to contributing new features.
  
# Credits 
`dash_curved_tabBar` is owned and maintained by the `Dashstack team`.
Follow us for updates and new releases 🚀.
