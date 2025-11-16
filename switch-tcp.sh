#!/bin/bash
case $1 in
  bbr)
    sudo modprobe tcp_bbr
    sudo sysctl -w net.ipv4.tcp_congestion_control=bbr
    echo "→ BBR Active"
    ;;
  cubic)
    sudo sysctl -w net.ipv4.tcp_congestion_control=cubic
    echo "→ Cubic Active"
    ;;
  dctcp)
    sudo sysctl -w net.ipv4.tcp_ecn=1
    sudo modprobe tcp_dctcp
    sudo sysctl -w net.ipv4.tcp_congestion_control=dctcp
    echo "→ DCTCP Active"
    ;;
  *)
    echo "Choice: bbr | cubic | dctcp"
    ;;
esac
