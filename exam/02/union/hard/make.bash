#!/bin/bash
set -e

clang -Wall -Werror -Wextra union.c -o union
./union zpadinton "paqefwtdjetyiytjneytjoeyjnejeyj" > real
./union ddf6vewg64f gtwthgdwthdwfteewhrtag6h4ffdhsd >> real
./union "rien" "cette phrase ne cache rien" >> real
./union >> real
./union one >> real
./union one two three >> real

clang -Wall -Werror -Wextra render/union/union.c -o union2
./union2 zpadinton "paqefwtdjetyiytjneytjoeyjnejeyj" > fake
./union2 ddf6vewg64f gtwthgdwthdwfteewhrtag6h4ffdhsd >> fake
./union2 "rien" "cette phrase ne cache rien" >> fake
./union2 >> fake
./union2 one >> fake
./union2 one two three >> fake

diff -y --suppress-common-lines real fake > __diff
bash leaks.bash union2

rm -rf union union2 real fake
