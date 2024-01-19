sep="|"

time=$(date +'%F %T')
time_output="⌚ $time"

keyboard_map=$(swaymsg -r -t get_inputs | jq -r '.[] | select(.identifier == "1241:17733:USB_Keyboard") | .xkb_active_layout_name')

if [ "$keyboard_map" = "Swedish" ]; then
  keymap_output="SV"
else
  keymap_output="EN"
fi

# TODO what source is the inbuilt mic?
inbuilt_mic_state=$(pactl get-source-mute alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source)

if [ "$inbuilt_mic_state" = "Mute: yes" ]; then
  inbuilt_mic_output="🔇"
else
  inbuilt_mic_output="🎤"
fi

echo "$inbuilt_mic_output $sep $time_output $sep $keymap_output "

