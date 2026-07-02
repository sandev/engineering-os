---
name: decision-making
description: Make and drive good decisions under uncertainty, clarifying the decision, who owns it, how reversible it is, and how to move forward without stalling. Use when a team is stuck, a choice has unclear ownership, a group can't reach consensus, or you need to decide with incomplete information.
---

# Decision-Making

Most organizational drag is not bad decisions, it's *undecided* decisions: choices that stall because no one owns them, everyone waits for certainty that never comes, or the group confuses consensus with progress. The skill is deciding well *and* at the right speed, then committing.

## Match speed to reversibility

The single most useful lens is **one-way vs two-way doors**:

- **Two-way door (reversible):** decide fast, with whoever's closest to the problem. Bias to action; you can undo it. Waiting costs more than a wrong-and-corrected choice.
- **One-way door (irreversible or very costly to reverse):** slow down, gather input, consider alternatives, and record the reasoning as an ADR (see the `architecture-decision-records` skill).

Most decisions are two-way doors treated, wrongly, as one-way. Misclassifying them is what makes orgs slow.

## Clarify the decision before debating it

Stalled decisions are usually unclear decisions. Pin down:

- **What exactly are we deciding?** State it as one question with a date.
- **Who owns it?** One accountable decision-maker (a **DACI/RACI** driver), not "the group." Consensus is a nice-to-have, not a requirement.
- **What would change our mind?** The information or threshold that resolves it, so you know when you have enough.
- **What's the default** if we don't decide? (Often worse than either option.)

## Decide with incomplete information

You will rarely have certainty; waiting for it is itself a (bad) decision.

- Decide when you have **~70% of the information** you wish you had; more than that and you're likely too slow (the Bezos heuristic).
- Make the **reversible** call now and learn; reserve deliberation for the irreversible.
- Separate **facts, assumptions, and opinions** explicitly, and name the assumptions you're betting on.
- Beware bias: sunk cost (past spend isn't a reason to continue), confirmation (seek the disconfirming view), and HiPPO (loudest/highest-paid opinion isn't evidence).

## Disagree and commit

Consensus is not required; **alignment after the decision** is. Solicit dissent *before* deciding (actively invite the strongest counter-argument) then, once the owner decides, everyone commits and executes as if it were their own, even those who disagreed. Re-litigating a made decision in the hallways is corrosive.

## Write it down

Record what was decided, by whom, why, the alternatives, and what would trigger a revisit. This kills re-litigation, onboards newcomers, and lets you learn from outcomes. For strategy-level choices, see the `technical-strategy` skill; to communicate the decision upward, see the `writing-for-executives` skill.

## Anti-patterns

- Treating reversible decisions as if they were irreversible (analysis paralysis).
- No clear owner, the decision belongs to "the group" and so to no one.
- Waiting for certainty that will never arrive.
- Requiring consensus, then getting the lowest-common-denominator choice.
- Deciding by loudest voice or seniority rather than reasoning and evidence.
- Reopening a settled decision every time someone's unhappy.
- Never recording decisions, so the org re-debates them forever.
