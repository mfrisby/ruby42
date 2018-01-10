#!/bin/bash
curl -v --silent $@ 2>&1 | grep -w Location | cut -d " " -f3
