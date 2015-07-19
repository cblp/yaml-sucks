#!/usr/bin/env python3

import  json
from    sys import exit, stderr, stdin
import  yaml

try:
    print(json.dumps(yaml.load(stdin)))
except Exception as e:
    print(e.__class__.__name__ + ':', e, file=stderr)
    exit(1)
