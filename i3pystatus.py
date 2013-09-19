from . import Status

status = Status(standalone=True)

status.register("clock", format="%a %-d %b %X")
status.register("load", format="load (1m): {avg1}")
status.register("alsa", format="♪ {volume}")

status.run()
