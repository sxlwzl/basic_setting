#!/bin/bash
# 法式 AZERTY / ISO 键盘：把数字 1 左侧那颗键（§ / ²，HID usage 0x64）
# 映射为美版的 ` 和 ~（HID usage 0x35）。
#
# 用法：
#   ./keyremap.sh on      立即生效；重启或注销后自动失效（临时方案）
#   ./keyremap.sh off     立即恢复原始键位
#   ./keyremap.sh status  查看当前生效的映射
#
# 说明：hidutil 的 UserKeyMapping 只写在当前会话的 HID Event System 里，
#       不写入磁盘，所以 on 天然就是「临时改一下」，不会留下残留。
set -u

MAP_ON='{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}'
MAP_OFF='{"UserKeyMapping":[]}'

case "${1:-status}" in
  on)     /usr/bin/hidutil property --set "$MAP_ON" ;;
  off)    /usr/bin/hidutil property --set "$MAP_OFF" ;;
  status) /usr/bin/hidutil property --get UserKeyMapping | head -9 ;;
  *)      echo "用法: $0 on|off|status"; exit 1 ;;
esac
