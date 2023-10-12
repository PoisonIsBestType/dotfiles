#!/bin/sh

bg='#19191998'
fg='#C8C8C8'
blue='#3F6CAD'
brt_blue='#2F88FF'
purple='#553976'
brt_purple='#8853C7'
red='#7B3E59'
green='#798347'


i3lock \
--insidever-color=$bg \
--ringver-color=$green \
--verif-color=$green \
\
--insidewrong-color=$bg \
--ringwrong-color=$red \
--wrong-color=$red \
\
--inside-color=$bg \
--ring-color=$blue \
--line-color=$brt_blue \
--separator-color=$brt_blue \
\
--modif-color=$brt_blue \
--greeter-color=$bg \
--time-color=$fg \
--date-color=$fg \
--keyhl-color=$purple \
--bshl-color=$bg \
--greeteroutline-color=$blue \
\
--verif-text="Let's see..." \
--wrong-text="Nope!" \
--noinput-text="Empty" \
--greeter-text="You shall not pass!" \
--time-font="JetBrainsMono Nerd Font" \
--date-font="JetBrainsMono Nerd Font" \
--verif-font="JetBrainsMono Nerd Font" \
--wrong-font="JetBrainsMono Nerd Font" \
--greeter-font="JetBrainsMono Nerd Font" \
--time-size="48" \
--date-size="18" \
--verif-size="25" \
--wrong-size="30" \
--greeter-size="30" \
--greeter-pos="x+683:h-8" \
--greeteroutline-width="0.5" \
\
--ignore-empty-password \
--screen 1 \
--radius 120 \
--ring-width 10 \
--fill \
--clock \
--indicator \
--time-str="%H:%M" \
--date-str="%a, %d/%m" \
--no-modkey-text \
\--image="$HOME/.config/awesome/background/blacklotus-stripe.png" \
--blur 5 \
