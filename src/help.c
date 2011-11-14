#include <stdio.h>
#include "help.h"

const char xf_version[] = "v0.3.0";

const char xf_usage_help[] = "xf <command> [<args>]";

const char xf_commands_help[] = 
    "xf commands:\n"
    "   version    Show version\n"
    "   help       Show this message\n"
    "   init       Initialize xfiles project";

void show_usage() {
    printf("usage: %s\n\n", xf_usage_help);
}

void show_commands() {
    printf("%s\n", xf_commands_help);
}

void show_version() {
    printf("xf %s\n", xf_version);
}
