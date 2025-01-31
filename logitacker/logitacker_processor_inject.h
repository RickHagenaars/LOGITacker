#ifndef LOGITACKER_PROCESSOR_INJECT_H
#define LOGITACKER_PROCESSOR_INJECT_H

#include "logitacker_processor.h"
#include "app_timer.h"

#define LOGITACKER_PROCESSOR_INJECT_USB_LED_TRIGGER_INJECTION_PRE_DELAY_MS 300

logitacker_processor_t * new_processor_inject(uint8_t const *target_rf_address, app_timer_id_t timer_next_action);

void logitacker_processor_inject_start_execution(logitacker_processor_t *p_processor_inject, bool execute);

void logitacker_processor_inject_mouse(logitacker_processor_t *p_processor_inject);


#endif //LOGITACKER_PROCESSOR_INJECT_H
