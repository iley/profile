#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import json
from jenkins import Jenkins

JOBS = [ 'master', 'umbrella' ]
COLOR_MAP = {
    'blue': '#00FF00',
    'red':  '#FF0000',
    'yellow': '#FFFF00'
}

jenkins_client = Jenkins("http://ci.igrade.ru",
                         "i-strukov",
                         "4da27773b566ea4a1f5e505754918566")

def jobs_info():
    info = jenkins_client.get_info()
    return { job["name"]: job["color"]
             for job in info["jobs"] }

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        jobs = jobs_info()

        # insert information into the start of the json, but could be anywhere
        # CHANGE THIS LINE TO INSERT SOMETHING ELSE
        for name in reversed(JOBS):
            if name not in jobs:
                continue
            color = jobs[name]
            j.insert(0, {'full_text' : u'• {}'.format(name),
                         'name' : 'jenkins_{}'.format(name),
                         'color': COLOR_MAP[color]})
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
