#!/bin/bash

# Copyright 2016, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Generate the C# code for .proto files

# enter Script.Rpc directory

if [[ $OSTYPE == "darwin"* ]]; then
     PLATFORM="macosx_x86"
elif [[ $OSTYPE == "linux"* ]];then
    PLATFORM="linux_x64"
fi

NUGET_PATH=$HOME/.nuget/packages/grpc.tools/1.4.1/tools/$PLATFORM
PROTO=./Proto/FunctionRpc.proto
MSGDIR=./Messages

rm -rf $MSGDIR
mkdir $MSGDIR

OUTDIR=$MSGDIR/DotNet
mkdir $OUTDIR
$NUGET_PATH/protoc $PROTO --csharp_out $OUTDIR --grpc_out=$OUTDIR --plugin=protoc-gen-grpc=$NUGET_PATH/grpc_csharp_plugin --proto_path=./Proto
