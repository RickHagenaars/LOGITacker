# Extract custom build
docker build -t logitacker .
docker run -ti logitacker /bin/bash
docker cp a14acadb889e:/root/build/logitacker_pca10059.hex ./


# Mouse injection
"logitacker_processor_inject_process_task_string" using the "p_get_next" to set the message payload "tmp_tx_payload" and state to "INJECT_STATE_WORKING". Also triggers the "app_timer_start".