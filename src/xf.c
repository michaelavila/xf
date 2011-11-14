#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include "help.h"

int does_xfiles_exist();

int main(int argc, char *argv[]) {
    // no command specified, show help
    if (argc == 1) {
        show_usage();
        show_commands();
        return 0;
    } 

    const char *cmd = argv[1];

    // handle help and version commands
    if (!strcmp(cmd, "help")) {
        show_usage();
        show_commands();
        return 0;
    } else if (!strcmp(cmd, "version")) {
        show_version();
        return 0;
    }

    // init cmd
    int found_xfiles = xfiles_exists();

    if (!found_xfiles && !strcmp(cmd, "init")) {
        mkdir(".xfiles", S_IRUSR | S_IWUSR);
        return 0;
    }

    // handle commands that require .xfiles
    if (!found_xfiles) {
        printf("No .xfiles found\n");
        return 0;
    }

    return 0;
}

int xfiles_exists() {
    struct stat sb;
    return stat(".xfiles", &sb) == 0 && S_ISDIR(sb.st_mode);
}
