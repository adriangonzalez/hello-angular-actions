#!/bin/bash

set -e

echo "Building app..."
npm run build

echo "Starting server on port 4200..."
npx serve dist/hello-angular-actions/browser -p 4200 &
SERVER_PID=$!

echo "Waiting for server to start..."
npx wait-on http://localhost:4200

echo "Running Lighthouse audit..."
npx lighthouse http://localhost:4200 --preset=desktop --view

echo "Cleaning up server..."
kill $SERVER_PID

echo "Done!"
