---
name: debugging
description: Find the root cause of a bug systematically instead of guessing. Use when diagnosing incorrect behavior, a crash, a performance problem, or a test failure, especially when the cause is not obvious or previous fix attempts have failed.
---

# Debugging

Debugging is applied science, not luck. The failure has a cause that obeys rules; your job is to locate it by forming hypotheses and testing them, narrowing the search space until the cause is cornered. Random changes ("try this and see") waste time and often mask the bug instead of fixing it.

## The method

```
- [ ] 1. Reproduce it reliably, a consistent repro is half the fix
- [ ] 2. Read the actual error, stack trace, and logs (don't skim)
- [ ] 3. Form ONE hypothesis about the cause
- [ ] 4. Design the cheapest test that confirms or refutes it
- [ ] 5. Change ONE thing, observe, keep a record
- [ ] 6. Narrow the search space (bisect) until the cause is isolated
- [ ] 7. Fix the cause, then confirm the repro is gone
- [ ] 8. Add a regression test so it can't return
```

## Reproduce first

If you cannot reproduce it, you cannot confirm you fixed it, you can only hope. Invest in a reliable, minimal reproduction: nail down the exact inputs, environment, and steps. Shrink it until only the essential trigger remains; the reduction itself often reveals the cause.

## Narrow the search space

The core move is **binary search** on the space of possible causes:

- **In code history:** `git bisect` to find the commit that introduced it.
- **In the code path:** check the value at the midpoint of the pipeline, is the data correct there? That halves where the fault can be.
- **In inputs:** remove half the input/config; does it still fail?
- **In the stack:** isolate layers, is it the client, the network, the service, or the data?

Each test should roughly halve the remaining possibilities.

## Principles

- **Question your assumptions.** The bug lives in what you're *sure* is correct. Verify, don't assume ("that function definitely returns a list", does it?).
- **Change one variable at a time.** Multiple simultaneous changes make it impossible to know what mattered, and can introduce new bugs.
- **Trust the evidence, not your mental model.** When they disagree, your model is wrong. Add logging/inspection to see what's *actually* happening.
- **Read the error message literally.** It usually says more than people give it credit for; the stack trace points at the scene.
- **It's your code first.** The bug is almost always in your code, not the compiler, OS, or library, assume that until proven otherwise.

## When stuck

- Explain the problem aloud, line by line (rubber-duck), articulating it surfaces the flawed assumption.
- Take a break; step away resets a stuck mental model.
- Make the invisible visible: more logging, a debugger, a trace, a minimal test harness.
- Check the boring causes: stale build/cache, wrong environment, uncommitted change, typo, config.

For production issues, mitigate first and debug from evidence afterward (see the `incident-postmortem` skill); rich telemetry is what makes root cause findable (see the `observability-and-slos` skill).

## Anti-patterns

- Changing code randomly hoping something works.
- "Fixing" the symptom (swallowing the error, adding a retry) without finding the cause.
- Skimming past the error message and stack trace.
- Debugging without a reliable reproduction.
- Changing several things at once, then not knowing which one mattered.
- Blaming the platform before ruling out your own code.
