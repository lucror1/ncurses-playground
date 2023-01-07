#include <curses.h>
#include <ncurses.h>

int main() {
	initscr();				// Start curses mode
	printw("Hello world!");	// Print hello world
	refresh();				// Show it on the screen for real
	getch();				// Wait for a keystroke
	endwin();				// End curses mode

	return 0;
}
