#!/usr/bin/env python3

import json
import sys
import yaml

try:
    print(json.dumps(yaml.load(sys.stdin)))
except Exception as e:
    print(e.__class__.__name__ + ':', e, file=sys.stderr)
    sys.exit(1)
