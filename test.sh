#!/usr/bin/env bash
  
read -r -d '' commands <<EOF
  7
  status
  status
  login 73
  login 123
  status
EOF

./main.py /rebuild /populate <<< "$commands"
