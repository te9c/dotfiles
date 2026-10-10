#!/bin/sh

# msg layout (1)
i3-msg "workspace 1; append_layout ~/.config/i3/layouts/msg.json"

(discord )
(telegram-desktop )

# spotify layout (10)
i3-msg "workspace 10; append_layout ~/.config/i3/layouts/spotify.json"

(spotify-launcher )

# firefox layout (2)
i3-msg "workspace 2; append_layout ~/.config/i3/layouts/firefox.json"

(firefox )

# terminal layout (3)
i3-msg "workspace 3; append_layout ~/.config/i3/layouts/terminal.json"

(kitty -d ~ )
