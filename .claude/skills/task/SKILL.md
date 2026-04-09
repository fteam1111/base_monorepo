---
name: task
description: Universal task orchestrator — classifies the task (new feature, small addition, bug fix) and dispatches to the right agents in order. Use for any development work: new features, adding functionality to existing features, or fixing bugs.
argument-hint: "[task description]"
---

# Task Orchestrator

You are the main orchestrator for all development work in this Flutter monorepo.

The task is: **$ARGUMENTS**

## Step 1 — Classify the task

Read the task description and classify into one of 3 types:

| Type | Signals | Flow |
|---|---|---|
| **New feature** | New screen, new package, new user flow | researcher → coding → qa → docs-writer |
| **Small addition** | Add API call, add button, add state, add UseCase to existing feature | researcher → coding → qa → docs-writer |
| **Bug fix** | Wrong behavior, crash, incorrect data, UI glitch | coding → qa |

> If unclear, ask the user one question to clarify before proceeding.

---

## Step 2 — Dispatch to agents

### For New Feature or Small Addition:

**2a. Spawn @researcher**

Instruct researcher:
- Task description: `$ARGUMENTS`
- Task type: [new feature / small addition]
- Use the matching plan template (A for new feature, B for small addition)
- Output: `implementation_plan.md`

**2b. Present plan to user and wait for approval**

Show the `implementation_plan.md` to the user. Ask:
> "Plan is ready. Approve to start coding, or let me know what to change."

Do NOT proceed until the user explicitly approves.

**2c. Spawn @coding**

Instruct coding agent:
- Read `implementation_plan.md`
- Task type: [new feature / small addition]
- Implement only what's in the plan

**2d. Spawn @qa**

Instruct qa agent:
- Review all files modified by coding agent
- Run `fvm flutter analyze`
- Fix all violations before reporting done

**2e. Spawn @docs-writer**

Instruct docs-writer agent:
- Task type: [new feature / small addition]
- For new feature: create tests + new SPEC.md
- For small addition: update existing tests + update relevant SPEC.md sections

---

### For Bug Fix:

**2a. Spawn @coding**

Instruct coding agent:
- Task description: `$ARGUMENTS`
- Task type: bug fix
- Read the relevant files, find root cause, fix only what's needed
- Do NOT create new files unless truly necessary
- Run `fvm flutter analyze` after fix

**2b. Spawn @qa**

Instruct qa agent:
- Focus review on modified files only
- Run `fvm flutter analyze`
- Verify the bug fix doesn't introduce new violations

---

## Hard rules
- NEVER skip user approval between researcher and coding
- NEVER run `melos gen_all` without asking user first
- NEVER spawn @docs-writer for a bug fix
- If any agent reports a blocker, stop and ask the user before continuing
- Keep the user informed at each transition: "researcher done, plan ready", "coding done, starting QA", etc.
