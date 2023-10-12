#!/bin/sh

bg='#e9e2c998'
fg='#585148'
blue='#585148'
brt_blue='#7A1405'
purple='#158f9C'
brt_purple='#158f9C'
red='#5e0f04'
green='#333f0a'


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
--time-size="52" \
--date-size="22" \
--verif-size="30" \
--wrong-size="45" \
--greeter-size="45" \
--greeter-pos="x+850:h-8" \
--greeteroutline-width="0.5" \
\
--ignore-empty-password \
--screen 1 \
--radius 160 \
--ring-width 15 \
--fill \
--clock \
--indicator \
--time-str="%H:%M" \
--date-str="%a, %d/%m" \
--no-modkey-text \
\--image="$HOME/.config/awesome/background/oldbook-stripe.png" \
--blur 5 \
