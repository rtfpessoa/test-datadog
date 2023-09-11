#!/usr/bin/env bash

service_name="datadog-agent"

# is_service_running() {
#   service "$service_name" status /dev/null 2>&1
# }

start_service() {
  echo "Starting $service_name..."

  # Fix API key
  sed -i "/fake-api-key/capi_key: $DD_API_KEY" /etc/datadog-agent/datadog.yaml
  service "${service_name}" start

  # Wait for service to start
  sleep 60
}

start_service

# while true; do
#   if is_service_running; then
#     echo "$service_name is running"
#     # Dump service logs for debug purposes
#     cat /var/log/datadog/agent.log
#     cat /var/log/datadog/process-agent.log
#     cat /var/log/datadog/trace-agent.log
#     break
#   else
#     echo "$service_name is not running"
#     start_service
#     # Dump service logs for debug purposes
#     cat /var/log/datadog/agent.log
#     cat /var/log/datadog/process-agent.log
#     cat /var/log/datadog/trace-agent.log
#   fi
# done

mkdir -p /var/log/roodle
/app/bin/app
