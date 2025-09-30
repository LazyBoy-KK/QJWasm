
#ifndef __BLEP_PARSER_H
#define __BLEP_PARSER_H

#include "token.h"
#include "def.h"

int blep_parser_init(char *, int);
int blep_parser_run();
struct token *blep_parser_cursor();

// below must be provided

__attribute__((import_module("env"), import_name("parserCallback")))
void blep_parser_callback();
__attribute__((import_module("env"), import_name("parserOpen")))
int blep_parser_open(int);
__attribute__((import_module("env"), import_name("parserClose")))
void blep_parser_close(int);

#endif//__BLEP_PARSER_H