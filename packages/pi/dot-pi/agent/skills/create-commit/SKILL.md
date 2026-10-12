---
name: create-commit
description: Create commits for the current branch. Use whenever the user asks to commit changes, create a fixup commit, push commits, or commit work before creating or updating a pull request.
---

# Create Commit

## Before Committing

1. Inspect the working tree, staged changes, branch history relative to `origin/master`, and whether the current branch has an existing GitHub pull request.
2. Summarize the relevant state before selecting a commit-message strategy.
3. Follow the active project's commit requirements, including any required attribution and restrictions on hooks or amending commits.
4. Commit only the intended files; stage them by explicit path rather than using `git add .` or `git add -A`.
5. Do not skip Git hooks unless the user explicitly requests it.

## Requests Involving a PR

- If the user also asks to create or update a pull request, load and follow the `create-pr` skill after committing.
- Preserve the user’s requested ordering. For example, a request to commit and create a PR should commit before starting the PR workflow; a request to commit a fixup and push should commit before pushing.

## Commit Message Rules

- For the first commit on a branch, use a conventional-commit title: `type(scope): concise description` when a scope is appropriate, otherwise `type: concise description`.
- Infer the conventional-commit type from the current context, plan, and diff. If the correct type is unclear, ask the user.
- Prefer a conventional-commit scope for the pertinent domain. If that domain is unclear from the current context or plan, ask the user.
- Make titles direct and readable. Use the conventional type to avoid redundant wording—for example, use `fix: broken controller`, not `fix: add fix for broken controller`.
- Use no commit-message body: the commit message is a single-line title only.
- Target roughly 50 characters and never exceed 72 characters. Abbreviate when needed to stay within the limit.
- After the first commit on a branch, do not use a conventional-commit type or scope. Prefix subsequent commit titles with `fixup:` instead.
