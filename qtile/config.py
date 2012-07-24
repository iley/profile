from libqtile.manager import Key, Screen, Group
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

# The bindings below are for use with a Kinesis keyboard, and may not make
# sense for standard keyboards.
keys = [
    # First, a set of bindings to control the layouts
    Key(
        ["mod4"], "k",
        lazy.layout.down()
    ),
    Key(
        ["mod4"], "j",
        lazy.layout.up()
    ),
    Key(
        ["mod4", "control"], "k",
        lazy.layout.shuffle_down()
    ),
    Key(
        ["mod4", "control"], "j",
        lazy.layout.shuffle_up()
    ),
    Key(
        ["mod4"], "space",
        lazy.layout.next()
    ),
    Key(
        ["mod4", "shift"], "space",
        lazy.layout.rotate()
    ),
    Key(
        ["mod4", "shift"], "Return",
        lazy.layout.toggle_split()
    ),

    Key(["mod4"], "n",      lazy.spawn("chromium-browser")),
    Key(["mod4"], "f",      lazy.spawn("pcmanfm")),
    Key(["mod4"], "x",      lazy.spawn("gnome-do")),
    Key(["mod4"], "h",      lazy.to_screen(1)),
    Key(["mod4"], "l",      lazy.to_screen(0)),
    Key(["mod4"], "Return", lazy.spawn("roxterm --color-scheme=Tango")),
    Key(["mod4"], "Tab",    lazy.nextlayout()),
    Key(["mod4"], "w",      lazy.window.kill()),

    Key(["mod4"], "q", lazy.spawn("killall qtile")),
]

# Next, we specify group names, and use the group name list to generate an appropriate
# set of bindings for group switching.
groups = [
    Group("1"),
    Group("2"),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
]

for i in groups:
    keys.append(
        Key(["mod4"], i.name, lazy.group[i.name].toscreen())
    )
    keys.append(
        Key(["mod4", "shift"], i.name, lazy.window.togroup(i.name))
    )


# Two simple layout instances:
layouts = [
    layout.Max(),
    layout.Stack(stacks=2)
]

# I have two screens, each of which has a Bar at the bottom. Each Bar has two
# simple widgets - a GroupBox, and a WindowName.
screens = [
    Screen(
        bottom=bar.Bar(
                    [
                        widget.GroupBox(),
                        widget.WindowName(),
                        widget.Volume(),
                        widget.Systray()
                    ],
                    30,
                ),
    ),
    Screen(
        bottom=bar.Bar(
                    [
                        widget.GroupBox(),
                        widget.WindowName()
                    ],
                    30,
                ),
    )
]


@hook.subscribe.startup
def on_start():
    import subprocess
    subprocess.call(["feh", "--bg-scale", "/home/iley/wallpaper.jpg"])
