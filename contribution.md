# Contributing to Retrack

Thank you for your interest in contributing to Retrack.

Retrack is an open-source platform for building collaborative, programmable, and workflow-aware business documents. Our goal is to create a reliable foundation for document-centric applications that is approachable to developers and dependable in production.

We welcome contributions of all sizes, including bug fixes, documentation improvements, tests, performance optimizations, new features, and design discussions.

---

# Code of Conduct

Please be respectful and constructive.

We expect contributors to:

* Be courteous and professional.
* Assume good intentions.
* Welcome differing viewpoints.
* Focus discussions on technical merit.
* Help maintain an inclusive and collaborative community.

---

# Before You Begin

Before starting significant work:

1. Search existing issues to avoid duplicate effort.
2. Open a discussion or issue for large features or architectural changes.
3. Wait for feedback before investing significant development time.

Small fixes such as documentation improvements, typo corrections, or isolated bug fixes generally do not require prior discussion.

---

# Development Environment

Recommended versions:

* Erlang/OTP 29(29.0.1)
* Elixir 1.20.1-otp-29
* PostgreSQL
* Node.js (for frontend assets)

Clone the repository:

```bash
git clone https://github.com/<organization>/Retrack.git
cd Retrack
```

Install dependencies:

```bash
mix setup
```

Run the application:

```bash
mix phx.server
```

Run tests:

```bash
mix test
```

Format code:

```bash
mix format
```

Run static analysis:

```bash
mix credo
mix dialyzer
```

All CI checks must pass before a pull request can be merged.

---

# Branch Naming

Use descriptive branch names.

Examples:

* feature/document-workflows
* feature/editor-comments
* bugfix/export-failure
* docs/getting-started
* refactor/document-storage

Avoid generic names such as:

* test
* fix
* update

---

# Commit Messages

Follow a simple convention.

Examples:

```
feat: add document approval workflow

fix: resolve concurrent editing race condition

docs: improve installation guide

refactor: simplify workflow executor
```

Keep commits focused on a single logical change whenever possible.

---

# Pull Requests

A pull request should:

* Explain the problem being solved.
* Describe the implementation.
* Include tests where appropriate.
* Update documentation if behavior changes.
* Remain focused on one feature or fix.

Large pull requests are harder to review. Prefer smaller, incremental contributions.

---

# Coding Standards

We value:

* Readability over cleverness.
* Simplicity over abstraction.
* Explicit behavior over implicit behavior.
* Clear naming.
* Comprehensive tests.

Please follow existing project conventions.

If introducing a new pattern, explain why it is preferable.

---

# Testing

Every bug fix should include a regression test whenever practical.

New functionality should include:

* Unit tests
* Integration tests where appropriate
* Documentation examples if public APIs change

Features without adequate test coverage are unlikely to be merged.

---

# Documentation

Documentation is a first-class contribution.

If your change affects:

* APIs
* Configuration
* Deployment
* User workflows
* Developer workflows

please update the relevant documentation in the same pull request.

---

# Architecture

Retrack is intentionally modular.

Contributors should preserve clear boundaries between:

* CRDT Engine
* Document Engine
* Business Runtime
* Web Interface
* Storage
* Plugin System

Avoid introducing unnecessary coupling between modules.

---

# Performance

Performance matters.

When modifying:

* collaboration
* synchronization
* persistence
* workflow execution

consider:

* memory usage
* network traffic
* algorithmic complexity
* latency

Include benchmarks when introducing substantial performance changes.

---

# Security

Please do not disclose security vulnerabilities publicly.

Instead, report them privately to the maintainers so they can be investigated and resolved before public disclosure.

---

# Feature Philosophy

Retrack is a document runtime.

Not every business feature belongs inside the core project.

When proposing new functionality, ask:

> Does this make documents more collaborative, programmable, or workflow-aware?

If not, it may be better suited as a plugin or external integration.

---

# License

By contributing to Retrack, you agree that your contributions will be licensed under the same license as the project.

---

# Thank You

Every contribution—whether code, documentation, testing, design, or feedback—helps improve Retrack.

We appreciate your time and your willingness to build the future of document-centric software with us.
