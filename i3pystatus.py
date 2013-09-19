from . import Status

status = Status(standalone=True)

status.register("clock",
                format="%a %-d %b %X")

#status.register("network",
                #interface="eth0",
                #format_up="{v4cidr}",)

status.register("load")

status.register("alsa")

status.run()
