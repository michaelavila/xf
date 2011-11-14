#include <stdio.h>
#include <string.h>
#include "help.h"

int main(int argc, char *argv[]) {
    // no command specified, show help
    if (argc == 1) {
        show_usage();
        show_commands();
        return 0;
    } 

    const char *cmd = argv[1];

    // handle command
    if (!strcmp(cmd, "help")) {
        show_usage();
        show_commands();
    } else if (!strcmp(cmd, "version")) {
        show_version();
    }

    return 0;
}
