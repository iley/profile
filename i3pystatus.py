from . import Status

status = Status(standalone=True)

status.register("clock", format="%a %-d %b %X")
status.register("load", format="load (1m): {avg1}")
status.register("alsa", format="♪ {volume}")
status.register("weather",
                location_code="RSXX0063:1",
                format="Weather in Moscow: {current_temp}")

status.run()
