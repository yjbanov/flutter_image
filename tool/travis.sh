#!/bin/bash

# Copyright (c) 2017, the Flutter project authors.  Please see the AUTHORS file
# for details. All rights reserved. Use of this source code is governed by a
# BSD-style license that can be found in the LICENSE file.

# Fast fail the script on failures.
set -e
# Print commands to stdout
set -x

flutter packages get
flutter analyze lib/ test/

$FLUTTER_HOME/bin/cache/dart-sdk/bin/dart test/network_test_server.dart &
SERVER_PID=$!
sleep 2

flutter test
kill $SERVER_PID
