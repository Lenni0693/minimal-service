package com.example.minimalservice;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class OkHealthIndicator implements HealthIndicator {

    @Override
    public Health health() {
        return Health.up()
                .withDetail("status", "OK")
                .build();
    }
}
