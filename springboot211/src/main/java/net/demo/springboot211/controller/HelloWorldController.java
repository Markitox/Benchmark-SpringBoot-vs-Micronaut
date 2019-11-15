package net.demo.springboot211.controller;

import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

  private final AtomicLong counter = new AtomicLong();

  @RequestMapping("/helloWorld")
  public String helloWorld() {
    return String.format("Request # %s", counter.incrementAndGet());
  }

}
