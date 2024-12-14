## 1.0.0

#### New Features
- **Giphy API Integration**: 
  - Added a comprehensive system for direct interaction with the Giphy API.
  - Features include:
    - **Search**: Search for GIFs, stickers, and emojis.
    - **Trending**: Retrieve trending items.
    - **Random**: Get random GIFs based on tags.
    - **Translate**: Translate words or phrases to GIFs.

- **Giphy Picker UI**:
  - Introduced a fully-featured picker widget for browsing and selecting GIFs, stickers, and emojis.
  - Features include:
    - **Search Functionality**: Integrated search bar for finding specific items.
    - **Pagination**: Efficiently browse through large sets of results with pagination.
    - **Loading Indicators**: Smooth loading indicators while fetching data and images.
    - **Error Handling**: Graceful handling of errors during API requests and image loading.
    - **User Interface**: Intuitive and user-friendly interface for easy navigation and selection.

## 1.0.1

### Change
- **Package Name**:
  - Change package name flutter_giphy to flutter_giphy_picker

- **Giphy Picker UI**:
  - Add reload favorites gifs / stickers on remove an element
  - Add message if no favorite found

## 1.0.2

### Change
  Update package for pub.dev


## 1.0.3

### Change
-	**File Structure Improvement**:
    -	Moved internal files to a src directory to improve package encapsulation and maintainability.
    -	Updated exports in giphy_api.dart and giphy_ui.dart to reflect the new structure.

- **Giphy UI Supported Language**:
  - Add French language for UI
  - Add English language for UI

### Details
  -	Internal files for API interaction and UI components are now located in lib/src/api/ and lib/src/ui/ respectively.
  -	Public API surface remains unchanged for package users.


## 1.0.4

### Change
- **Giphy picker**:
  - Update gif in select_gif view for slow internet connection.
  - Minor bugs fixe


## 1.0.5

### Change
- **Giphy picker**:
  - Bug fixes on add sticker to favorite
  - Edit the first view on open picker to show the trending gifs
  - Modifie the default theme mode of the picker to match with the app theme mode


## 1.0.6

### Change
- **Giphy picker**:
  - Improve error message in gif picker
  - Print full error message in console in debug mode
  - Update giphy_ui library to enable compatibility for web
  - Add a new parameter `debugMode` in `showGiphyPicker` function to enable debug mode by default it's false

- **Giphy API**:
  - Update GiphyAPI to add debug mode to print full request and response information in console


## 1.0.7

### Change
- **General Package Dependencies**
  - Upgrade all dependencie to the latest version if possible.


## 1.0.8

### Change
- **Giphy UI**:
  - *From a pull requets*:
    - Add useSafeArea in GiphyUIConfig for the showGiphyPicker function.
  - Remove deprecated dart / flutter elements.


## 1.0.9

### Change
- **Giphy UI**:
  - *From a pull requests*:
    - Add an option to use dialog for Giphy picker
  - Fix bug in emoji variation widget