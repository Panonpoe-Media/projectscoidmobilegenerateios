typedef ProgressDlCallback = void Function(int count, int total);
typedef ProgressULCallback = void Function(int count, int total);
typedef void OnError(Exception exception);
enum AppAction { listing, edit, add, view, post, search, indexing}
enum AppBarBehavior { normal, pinned, floating, snapping }
enum PlayerState { stopped, playing, paused }
