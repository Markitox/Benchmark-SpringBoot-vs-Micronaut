package net.demo.controller;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import java.util.concurrent.atomic.AtomicLong;

@Controller("/helloWorld")
public class HelloWorldController {

  private final AtomicLong counter = new AtomicLong();

  @Get
  public String helloWorld() {
    return String.format("Request # %s", counter.incrementAndGet());
  }
}
