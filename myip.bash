#!/bin/bash

ip addr | grep "/24" | awk '{print $2}'
