sep="|"

brightness_level=$(brightnessctl -m | cut -d ',' -f 4)
brightness_output="🔆 $brightness_level"

time=$(date +'%F %T')
time_output="⌚ $time"

bat_state=$(acpi -a)
bat_level=$(acpi -b | cut -d ',' -f 2)
bat_duration_remaining=$(acpi -b | cut -d ',' -f 3 | tr -d ' remaining')
bat_level=$(acpi -b | cut -d ',' -f 2)

if [ "$bat_state" = "Adapter 0: on-line" ]; then
  battery_state_output="⚡$bat_level"
else
  battery_state_output="🔋$bat_level ($bat_duration_remaining)"
fi

keyboard_map=$(swaymsg -r -t get_inputs | jq -r '.[] | select(.identifier == "1:1:AT_Translated_Set_2_keyboard") | .xkb_active_layout_name')

if [ "$keyboard_map" = "Swedish" ]; then
  keymap_output="SV"
else
  keymap_output="EN"
fi

inbuilt_mic_state=$(pactl get-source-mute alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source)

if [ "$inbuilt_mic_state" = "Mute: yes" ]; then
  inbuilt_mic_output="🔇"
else
  inbuilt_mic_output="🎤"
fi

echo "$inbuilt_mic_output $sep $brightness_output $sep $battery_state_output $sep $time_output $sep $keymap_output "

