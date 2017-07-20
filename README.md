# Webscale Fizz Buzz

Code that shows off different ways of processing an infinite stream (natural
numbers), and applying some transformation (fizz buzz!) to them, and then
outputting them.

This was hacked together for the July 2017 [Elixir
Melbourne](https://www.meetup.com/Elixir-Melbourne/) meetup to talk through the
different approaches in my talk there.

Each "service" (fizzbuzz etc) runs *WEBSCALE!*, which basically means it calls
`Process.sleep(100)` to simulate latency in a complex system.

# Approaches

## Streaming

Simple, but runs purely sequentially without any concurrency. Is super slow, as
each service adds latency.

```elixir
FizzBuzz.streamed
```

## GenServer

Implement each service as a GenServer process. This is faster, as each service
runs in parallel, and total latency is just the slowest service (rather than
adding all together).

Problem is though, this uses a naive approach where the producer sends as many
messages as it can to the first GenServer in the pipeline, quickly filling the
mailbox of that process, exhausting memory and causing bad things to happen.

```elixir
FizzBuzz.gen_server
```

While that's running, run `:observer.start` and watch memory usage skyrocket.

## GenStage

Similar to GenServer, but using GenStage to use back pressure on the producer to
limit the rate at which it sends through events. The GenStage implementations
themselves using `Task` to async process the events.

```elixir
FizzBuzz.gen_stage
```

## Flow

Use Flow to more declaritively specify the pipeline. Needs some tweaking, as
still not as fast as GenStage, and fizzbuzz results are not output in order. I
need to play with this more to get my head around it.

```elixir
FizzBuzz.flow
```
