#!/bin/bash
set -e

clang -Wall -Werror -Wextra get_next_line.c main.c -I ./ -o real_gnl
clang -Wall -Werror -Wextra render/get_next_line/get_next_line.c main.c -I ./render/get_next_line/ -o fake_gnl

# REAL =========================================================================
./real_gnl < files/41_no_nl >> real
./real_gnl < files/41_with_nl >> real
./real_gnl < files/42_no_nl >> real
./real_gnl < files/42_with_nl >> real
./real_gnl < files/43_no_nl >> real
./real_gnl < files/43_with_nl >> real
./real_gnl < files/alternate_line_nl_no_nl >> real
./real_gnl < files/alternate_line_nl_with_nl >> real
./real_gnl < files/big_line_no_nl >> real
./real_gnl < files/big_line_with_nl >> real
./real_gnl < files/empty >> real
./real_gnl < files/multiple_line_no_nl >> real
./real_gnl < files/multiple_line_with_nl >> real
./real_gnl < files/multiple_nlx5 >> real
./real_gnl < files/nl >> real
# FAKE =========================================================================
./fake_gnl < files/41_no_nl >> fake
./fake_gnl < files/41_with_nl >> fake
./fake_gnl < files/42_no_nl >> fake
./fake_gnl < files/42_with_nl >> fake
./fake_gnl < files/43_no_nl >> fake
./fake_gnl < files/43_with_nl >> fake
./fake_gnl < files/alternate_line_nl_no_nl >> fake
./fake_gnl < files/alternate_line_nl_with_nl >> fake
./fake_gnl < files/big_line_no_nl >> fake
./fake_gnl < files/big_line_with_nl >> fake
./fake_gnl < files/empty >> fake
./fake_gnl < files/multiple_line_no_nl >> fake
./fake_gnl < files/multiple_line_with_nl >> fake
./fake_gnl < files/multiple_nlx5 >> fake
./fake_gnl < files/nl >> fake
# ==============================================================================

diff -y --suppress-common-lines real fake > __diff
bash leaks.bash fake_gnl

rm -rf fake real real_gnl fake_gnl
