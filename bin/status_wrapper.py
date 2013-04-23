#!/usr/bin/env python
# -*- coding: utf-8 -*-
import re
import sys
import json
from itertools import cycle
from jenkins import Jenkins

JOBS = [ 'master', 'current' ]
static_char = '●'
progress_chars = cycle([ '●', '○' ])

def get_color(name):
    name = re.sub(r'_.*$', '', name)
    color_map = {
        'blue': '#00FF00',
        'red':  '#FF0000',
        'yellow': '#FFFF00',
        'grey': '#999999',
        'aborted': '#999999'
    }
    # purple means 'WTF?'
    return color_map.get(name, '#FF00FF')

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
            if color.endswith('_anime'):
                char = next(progress_chars)
            else:
                char = static_char
            j.insert(0, {'full_text' : u'{} {}'.format(char, name),
                         'name' : 'jenkins_{}'.format(name),
                         'color': get_color(color)})
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
