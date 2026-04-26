#!/bin/bash
# Phase 1: Chaos Engineering Fire Drill
# Runs at 3:00 AM on Sundays
echo "[$(date)] INITIATING FIRE DRILL: Simulating API 401 Error..." >> ~/scripts/chaos.log
# Simulating a blocked port/timeout to test fallback resilience
timeout 5s curl -s -X POST "https://api.groq.com/openai/v1/chat/completions" -H "Authorization: Bearer FAKE_KEY" -d "{\"model\": \"llama3\", \"messages\": [{\"role\": \"user\", \"content\": \"test\"}]}" >> ~/scripts/chaos.log 2>&1
echo -e "\n[$(date)] FIRE DRILL COMPLETE. Watchdog engaged." >> ~/scripts/chaos.log

