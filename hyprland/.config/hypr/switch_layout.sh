#!/usr/bin/env bash

hyprctl keyword workspace $(hyprctl activeworkspace | sed -nE 's/workspace ID (\w+)\s.*/\1/p'), layout:$1
