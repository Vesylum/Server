#!/bin/sh

if ! command -v git 2>&1 >/dev/null; then
	echo You must install Git to proceed
	exit 1
fi

if ! command -v npm 2>&1 >/dev/null; then
	echo You must install Node.js to proceed
	exit 1
fi

node_version=$(node --version)
node_major=${node_version#v}
node_major=${node_major%%.*}
if [ "$node_major" -lt 24 ]; then
	echo "Node.js 24 or newer is required. Detected $node_version"
	exit 1
fi

npm install
node start.js
