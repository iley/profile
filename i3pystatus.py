from . import Status

status = Status(standalone=True)

status.register("clock", format="%a %-d %b %X")
status.register("load")
status.register("alsa", format="♪ {volume}")

status.run()
