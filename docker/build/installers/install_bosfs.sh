 
#!/usr/bin/env bash

###############################################################################
# Copyright 2019 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

# Fail on first error.
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

# Prepare
apt-get update -y
apt-get install -y libfuse-dev autotools-dev automake uuid-dev
wget http://sdk.bce.baidu.com/console-sdk/bosfs-1.0.0.8.tar.gz
tar zxf bosfs-1.0.0.8.tar.gz

# Build and install.
pushd bosfs-1.0.0
  bash build.sh
popd

# Clean
rm -fr bosfs-1.0.0.8.tar.gz bosfs-1.0.0
apt-get autoremove -y libfuse-dev
