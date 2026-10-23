# DevOps Learning Roadmap

**Version:** 1.2.0
**Status:** Active
**Related Document:** DLOS.md
**Last Updated:** 2026-10-23

> Purpose: Defines the complete DevOps curriculum for DLOS.

---

# Table of Contents

1. Introduction
2. Purpose
3. Learning Strategy
4. Learning Progression
5. Curriculum Overview
6. Current Position
7. Learning Phases
8. Learning Methodology
9. Projects
10. Milestones
11. Progression Rules
12. External Resources
13. Completion Criteria
14. Long-Term Goals
15. Future Expansion
16. Version History

---

# 1. Introduction

This roadmap defines the complete DevOps learning journey. It is intentionally stable and should change only when the curriculum changes. Daily progress belongs in LEARNING_TRACKER.md.

# 2. Purpose

- Structured learning path
- Correct dependency order
- Practical projects
- Professional portfolio
- Measurable milestones

# 3. Learning Strategy

Foundation → Core DevOps → Cloud → Automation → Production Engineering → Specialization

# 4. Learning Progression

Linux → Networking → Git → Docker → Kubernetes → CI/CD → AWS → Terraform → Ansible → Monitoring & Logging → DevOps Security → Capstone → Career Preparation

# 5. Curriculum Overview

Repository Foundation → Linux → Networking → Git → Docker → Kubernetes → CI/CD → AWS → Terraform → Ansible → Monitoring & Logging → DevOps Security → Capstone → Career Preparation

# 6. Current Position

Current Phase: Linux Fundamentals

For daily progress see LEARNING_TRACKER.md.

# 7. Learning Phases

## Standard Phase Structure

Every phase contains:

- Estimated Duration
- Status
- Prerequisites
- Objective
- Why This Phase Matters
- Learning Outcomes
- Topics Covered
- Hands-on Labs
- Mini Projects
- Phase Project
- Deliverables
- Interview Preparation
- Completion Criteria
- Phase Exit Criteria

---

## Phase 0 — Repository Foundation

Estimated Duration: 1 Week

Status: Completed

Objective: Build the DLOS learning system.

Deliverables:
- DLOS.md
- ROADMAP.md
- LEARNING_TRACKER.md
- SYSTEM_CHANGELOG.md

Exit Criteria:
Repository is self-documenting.

---

## Phase 1 — Linux Fundamentals

Estimated Duration: 4–6 Weeks

Status: In Progress

Prerequisites:
- Repository Foundation

Objective:
Become comfortable administering Linux systems.

Why This Phase Matters:
Linux powers the majority of modern cloud and DevOps infrastructure.

Learning Outcomes:
- Navigate Linux confidently
- Manage users, groups and permissions
- Work with processes and services
- Write shell scripts
- Troubleshoot Linux systems

Topics Covered:
- Filesystem
- Shell
- Users & Groups
- Permissions
- Editors
- Package Management
- Processes
- Services
- Environment Variables
- Shell Scripting
- Logs
- Cron
- SSH

Hands-on Labs:
- File management
- User management
- Package management
- Service management
- Shell scripting

Mini Projects:
- Backup Script
- User Automation Script

Phase Project:
Linux Server Administration Lab

Deliverables:
- Lesson Notes
- Knowledge Book Updates
- Scripts
- Reflection
- Git Commits

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Independent Project — Linux Server Administration Lab

Build and document a Linux administration lab that demonstrates the ability to configure, inspect, and troubleshoot a Linux system. Complete this project only after the relevant learning and hands-on work has been performed.

**Acceptance Criteria**
- Document the lab environment, prerequisites, and setup procedure.
- Demonstrate file and directory management, users and groups, and permissions.
- Demonstrate package management and service inspection or management.
- Investigate process behavior and document the diagnostic commands used.
- Demonstrate environment-variable handling and practical shell scripting.
- Inspect relevant system logs and document at least two troubleshooting scenarios.
- Include scripts or configuration files created for the lab, with usage instructions.
- Record observed outputs, issues encountered, and their resolutions.
- Document SSH or other relevant access controls where applicable.
- Include cleanup instructions and clearly identify anything not implemented or tested.

---

### Interview Readiness

- Concepts understood
- Hands-on completed
- Able to explain architecture
- Able to troubleshoot

Interview Preparation:
Linux administration fundamentals

---

### Definition of Done

- Theory completed
- Labs completed
- Independent project completed
- Documentation committed
- GitHub updated

Phase Exit Criteria:
Able to administer a Linux server independently.

---

## Remaining Phases

### Phase 2 — Networking Fundamentals (2–3 Weeks)

**Learning Outcomes**
- Explain IP addresses, subnet masks/CIDR, default gateways, and routing.
- Explain DNS resolution, ports, TCP vs. UDP, and common network protocols.
- Inspect network interfaces, routes, listening sockets, and active connections on Linux.
- Use `ip`, `ss`, `ping`, `traceroute`/`tracepath`, `dig`/`nslookup`, and `curl` to investigate connectivity.
- Troubleshoot a network issue methodically, distinguishing name-resolution, routing, connectivity, and service-port problems.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Network Troubleshooting Toolkit

Create a documented set of commands and a troubleshooting checklist for diagnosing common Linux connectivity issues.

**Acceptance Criteria**
- Include commands for interface/address inspection, routes, DNS, connectivity, and listening ports.
- Explain what each command checks and how to interpret a successful or failed result.
- Include at least three troubleshooting scenarios with observed output and a reasoned diagnosis.
- Clearly distinguish tests that were actually run from examples that were not tested.

---

### Independent Project — Networked Linux Environment

Build and document a small networked Linux environment using available local VMs, containers, or another suitable lab setup.

**Acceptance Criteria**
- Document the topology, IP addressing, and intended communication paths.
- Demonstrate connectivity between the relevant systems or services.
- Include at least two deliberately investigated connectivity failures or controlled troubleshooting scenarios.
- Record diagnostic commands, observations, root cause, and resolution for each scenario.
- Include setup instructions and limitations so another person can reproduce the lab where feasible.
- Do not claim tests or infrastructure were completed unless evidence exists.

---

### Interview Readiness

- Explain DNS resolution, TCP vs. UDP, routing, CIDR, gateways, and ports in your own words.
- Describe a step-by-step approach to diagnosing a host that cannot reach a service.
- Interpret representative output from `ip route`, `ss -tuln`, and DNS lookup tools.
- Explain the difference between a DNS failure, a routing problem, and a service that is not listening.
- Answer scenario-based questions without relying solely on memorized definitions.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed and results recorded.
- [ ] Network Troubleshooting Toolkit meets its acceptance criteria.
- [ ] Networked Linux Environment meets its acceptance criteria.
- [ ] Troubleshooting evidence and limitations documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to inspect and troubleshoot common Linux networking problems methodically, explain the diagnosis, and demonstrate the reasoning with recorded evidence.

---

### Phase 3 — Git & Version Control (2 Weeks)

**Learning Outcomes**
- Explain the working tree, staging area, local repository, and remote repository.
- Use commits, branches, merges, and conflict resolution safely.
- Inspect history and changes using `git log`, `git diff`, and related commands.
- Work with remotes, fetch, pull, push, and pull requests.
- Recover from common mistakes using appropriate Git tools, including `git restore`, `git revert`, and carefully chosen reset operations.
- Explain the purpose of `.gitignore` and avoid committing secrets or generated files.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Git Recovery and Workflow Lab

Use a disposable repository to practice everyday Git operations and recover from intentional mistakes.

**Acceptance Criteria**
- Demonstrate staging, committing, inspecting diffs, and reviewing history.
- Create and merge a branch.
- Resolve and document at least one merge conflict.
- Demonstrate a safe recovery from an intentionally introduced mistake.
- Explain when to use `revert` versus `reset`, including the risks of rewriting shared history.
- Record commands, outcomes, and any relevant limitations.

---

### Independent Project — Collaborative Git Workflow

Use a dedicated practice repository to simulate a contribution workflow using branches and pull requests.

**Acceptance Criteria**
- Establish a clear `main` branch and a documented branch-naming convention.
- Make a change on a separate branch and submit it through a pull request.
- Include a meaningful description and review checklist.
- Demonstrate how a conflict or requested revision would be handled; label simulations honestly if no second contributor is available.
- Include a README explaining the workflow and how to reproduce the exercise.
- Keep commits focused and avoid including credentials, secrets, or unrelated generated files.

---

### Interview Readiness

- Explain the lifecycle of a change from working tree to a remote pull request.
- Explain merge commits, fast-forward merges, and conflict resolution.
- Compare `fetch`, `pull`, `merge`, `rebase`, `revert`, and `reset`.
- Describe how to investigate an unexpected file change or a problematic commit.
- Explain how to protect secrets and keep repository history understandable.
- Demonstrate the workflow in a disposable repository without risking important work.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on exercises completed with recorded results.
- [ ] Git Recovery and Workflow Lab meets its acceptance criteria.
- [ ] Collaborative Git Workflow meets its acceptance criteria.
- [ ] Commands, recovery decisions, and workflow documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to manage a small Git-based collaboration workflow, diagnose common repository problems, and choose safe recovery actions with a clear understanding of their consequences.


---

### Phase 4 — Docker (3 Weeks)

**Learning Outcomes**
- Explain images, containers, registries, layers, and image builds.
- Write and maintain Dockerfiles using appropriate base images, build contexts, and `.dockerignore`.
- Manage container ports, environment variables, volumes, and persistent data.
- Use Docker Compose to run and connect multiple services.
- Inspect container logs, health, resource usage, and exit states to troubleshoot failures.
- Apply basic container security practices, including non-root execution where supported, minimal images, and safe handling of secrets.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Container Operations Lab

Build and document a small container image, then practice common container lifecycle and troubleshooting tasks.

**Acceptance Criteria**
- Build an image from a documented Dockerfile.
- Run, inspect, stop, remove, and rebuild the container.
- Demonstrate port mapping and configuration through environment variables.
- Inspect logs and diagnose at least two controlled failure scenarios.
- Document the commands used, observed results, and recovery steps.
- Explain which data persists when a container is removed and which data does not.

---

### Independent Project — Multi-Service Containerized Application

Containerize a small application with at least two communicating services, using Docker Compose where appropriate.

**Acceptance Criteria**
- Include application source or a clearly documented reproducible application.
- Provide a Dockerfile and Compose configuration.
- Configure service communication, ports, and environment-specific settings.
- Use persistent storage if a service requires durable data.
- Include health checks or a documented service-readiness strategy where appropriate.
- Explain configuration and secret-handling choices; do not commit real credentials.
- Demonstrate startup, normal operation, shutdown, and recovery from at least one service failure.
- Document setup, validation commands, architecture, and known limitations.

---

### Interview Readiness

- Explain the difference between an image and a container.
- Describe Dockerfile layers, build context, and image caching.
- Explain port mapping, container networking, volumes, and bind mounts.
- Diagnose a container that exits unexpectedly or cannot reach another service.
- Explain the purpose and limitations of Compose health checks.
- Describe practical ways to reduce image size and container privileges.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] Container Operations Lab meets its acceptance criteria.
- [ ] Multi-Service Containerized Application meets its acceptance criteria.
- [ ] Troubleshooting evidence and architecture documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to build, run, configure, inspect, and troubleshoot a multi-service containerized application and explain the design decisions.

---

### Phase 5 — Kubernetes (4–5 Weeks)

**Learning Outcomes**
- Explain cluster architecture, control-plane responsibilities, nodes, and workloads.
- Create and inspect Pods, Deployments, ReplicaSets, Services, and Namespaces.
- Configure application settings and sensitive values using ConfigMaps and Secrets appropriately.
- Understand probes, resource requests and limits, and rollout strategies.
- Diagnose scheduling, image-pull, startup, networking, and configuration failures.
- Explain persistent storage, ingress, access control, and security-context basics.
- Distinguish a local learning cluster from a hardened production cluster.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Kubernetes Deployment and Troubleshooting Lab

Deploy a sample application to a local or otherwise accessible learning cluster and practice common operational tasks.

**Acceptance Criteria**
- Define Kubernetes manifests for a Deployment and a Service.
- Apply, inspect, update, and remove the resources.
- Demonstrate scaling and a controlled rollout or rollback.
- Inspect events, Pod status, and logs to diagnose at least two controlled failure scenarios.
- Document how the application is reached and how the deployment's status is verified.
- Record cluster prerequisites and any limitations of the environment used.

---

### Independent Project — Kubernetes Application Platform

Deploy a containerized application to Kubernetes with documented operational and security considerations.

**Acceptance Criteria**
- Provide version-controlled manifests or a documented packaging approach.
- Include Deployments, Services, configuration resources, and appropriate health probes.
- Define resource requests and limits where appropriate for the workload.
- Document scaling, rollout, rollback, and troubleshooting procedures.
- Address persistent data if the application requires it.
- Document access control, secret handling, and container security-context decisions.
- Demonstrate successful deployment and at least two investigated failure scenarios.
- Include architecture, setup instructions, validation evidence, and known limitations.
- Treat production readiness as a set of evaluated requirements; do not claim high availability, security, or production readiness without supporting evidence.

---

### Interview Readiness

- Explain Pods, Deployments, ReplicaSets, Services, and the control plane.
- Diagnose common `Pending`, `ImagePullBackOff`, and `CrashLoopBackOff` situations.
- Explain readiness, liveness, and startup probes.
- Describe requests vs. limits, rollout status, scaling, and rollback.
- Explain how Services enable communication and how configuration and secrets should be handled.
- Identify what additional work is required before a learning deployment could be used in production.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] Kubernetes Deployment and Troubleshooting Lab meets its acceptance criteria.
- [ ] Kubernetes Application Platform meets its acceptance criteria.
- [ ] Operational and security decisions documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to deploy and troubleshoot a Kubernetes application, explain its operational behavior, and identify the additional controls required for production use.

---

### Phase 6 — CI/CD (3 Weeks)

**Learning Outcomes**
- Explain continuous integration, continuous delivery, and continuous deployment.
- Design a pipeline with source checkout, validation, testing, artifact creation, and deployment stages.
- Configure automated triggers, environment-specific settings, and pipeline variables.
- Handle pipeline failures by inspecting logs and identifying the failed stage.
- Apply basic pipeline security practices, including least privilege and safe secret management.
- Explain deployment strategies, rollback options, and the purpose of approval gates.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Automated Build and Test Pipeline

Create a pipeline that automatically validates a small application when changes are pushed or a pull request is opened.

**Acceptance Criteria**
- Store the pipeline definition in version control.
- Run at least one automated validation or test step.
- Make the pipeline's result visible and explain how failures are investigated.
- Demonstrate a successful run and a deliberately failing validation.
- Document triggers, stages, prerequisites, and how to reproduce the workflow.
- Do not include real credentials in source code or pipeline configuration.

---

### Independent Project — Automated Deployment Pipeline

Build a pipeline that validates, packages, and deploys a small application to a suitable test environment.

**Acceptance Criteria**
- Define clear build, test, and deployment stages.
- Trigger validation automatically from a documented repository event.
- Produce a versioned artifact or otherwise demonstrate which application version is deployed.
- Deploy to a local, container-based, or cloud test environment that is available to you.
- Demonstrate a failed pipeline run and document the diagnosis and recovery.
- Document deployment verification and a rollback or recovery procedure.
- Handle secrets through the platform's supported secret mechanism or a documented local equivalent.
- Explain permissions, approval gates, and environment separation where applicable.
- Include architecture, setup instructions, evidence of successful execution, and known limitations.

---

### Interview Readiness

- Explain CI, continuous delivery, and continuous deployment.
- Describe the purpose and ordering of pipeline stages.
- Explain how a pipeline should handle failed tests and failed deployments.
- Describe artifact versioning and how to identify the deployed version.
- Explain how credentials, permissions, and deployment approvals should be managed.
- Compare deployment and rollback strategies appropriate to the project's environment.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] Automated Build and Test Pipeline meets its acceptance criteria.
- [ ] Automated Deployment Pipeline meets its acceptance criteria.
- [ ] Successful and failed execution evidence documented.
- [ ] Security, deployment verification, and recovery decisions documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to build, troubleshoot, and explain an automated pipeline that validates application changes and deploys a traceable version to a test environment.

---

### Phase 7 — AWS (4 Weeks)

**Learning Outcomes**
- Explain AWS Regions, Availability Zones, and the shared responsibility model.
- Understand IAM users, roles, policies, and least-privilege access.
- Explain core compute, storage, networking, and monitoring services relevant to a small application.
- Understand VPCs, subnets, route tables, security groups, and public versus private access.
- Deploy and verify a small cloud workload using documented configuration and access controls.
- Inspect logs, metrics, and service status to investigate basic failures.
- Recognize cost, security, and cleanup responsibilities when using cloud resources.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — AWS Service Exploration and Access Lab

Use an available AWS learning environment or an equivalent guided lab to investigate core services and identity/access concepts.

**Acceptance Criteria**
- Document the Region and services used.
- Explain the role of IAM permissions in the lab.
- Demonstrate a small service task appropriate to the available environment.
- Record the relevant configuration, verification steps, and observed output.
- Identify potential costs and document how resources are verified and cleaned up.
- If AWS access is unavailable, complete a clearly labeled simulation or guided exercise and document what was not independently deployed.

---

### Independent Project — Cloud Infrastructure Deployment

Design and deploy a small AWS workload using only services and resources appropriate to the available budget and permissions.

**Acceptance Criteria**
- Include an architecture diagram or equivalent architecture description.
- Document the Region, services, networking, access controls, and expected traffic flow.
- Apply least-privilege access and avoid exposing credentials in the repository.
- Demonstrate the workload's intended behavior and document validation evidence.
- Capture relevant logs, metrics, or service status information.
- Estimate or review expected costs and document cleanup steps.
- Record at least one investigated configuration or connectivity problem, if the environment permits.
- Include setup instructions, operational limitations, and a resource inventory.
- If live deployment is not feasible, provide a reproducible plan or lab-based implementation and explicitly distinguish it from deployed infrastructure.

---

### Interview Readiness

- Explain Regions, Availability Zones, IAM roles and policies, and the shared responsibility model.
- Describe VPCs, subnets, route tables, and security groups.
- Explain how you would grant an application access to a service without embedding credentials.
- Describe basic approaches to monitoring, troubleshooting, and controlling cloud costs.
- Explain how you would verify and safely remove resources after a lab.
- Distinguish a tested cloud deployment from a proposed architecture or simulation.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] AWS Service Exploration and Access Lab meets its acceptance criteria.
- [ ] Cloud Infrastructure Deployment meets its acceptance criteria, or its documented alternative clearly states the limitations.
- [ ] Architecture, access controls, verification, and cleanup documented.
- [ ] Cost considerations and relevant troubleshooting evidence recorded.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to explain core AWS architecture and access-control concepts and demonstrate, or clearly document the limitations of, a small cloud workload deployment.

---

### Phase 8 — Terraform (2–3 Weeks)

**Learning Outcomes**
- Explain declarative infrastructure as code and Terraform's core workflow.
- Use providers, resources, data sources, variables, outputs, and modules.
- Understand Terraform state, plans, dependency graphs, and drift.
- Use `init`, `fmt`, `validate`, `plan`, `apply`, and `destroy` appropriately.
- Structure configuration for reuse and maintainability.
- Protect state and credentials and understand the risks of state files containing sensitive values.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Reusable Terraform Module

Create a small Terraform configuration that provisions a suitable resource using a provider or local testing option available to you.

**Acceptance Criteria**
- Declare inputs using variables and expose useful outputs.
- Run formatting and validation checks.
- Review and document the execution plan before applying changes.
- Demonstrate a controlled configuration change and explain the plan difference.
- Document state handling, prerequisites, and cleanup.
- If a live provider is unavailable, use a clearly labeled validation or testing alternative and state what was not provisioned.

---

### Independent Project — Infrastructure Provisioning

Create a version-controlled Terraform project that provisions a small, reproducible environment appropriate to your available provider, permissions, and budget.

**Acceptance Criteria**
- Document the intended architecture and resources.
- Separate reusable inputs from resource definitions using variables and outputs.
- Use modules where they provide meaningful reuse.
- Include formatting and validation instructions and a documented plan-review workflow.
- Explain how state is stored, protected, and shared, if applicable.
- Avoid committing credentials, state files containing sensitive data, or other secrets.
- Demonstrate a controlled update and explain how Terraform determines the changes.
- Include cleanup instructions and identify resources that could incur costs.
- Document successful checks, actual provisioning evidence if applicable, and known limitations.

---

### Interview Readiness

- Explain Terraform's declarative model and the plan/apply workflow.
- Describe providers, resources, data sources, variables, outputs, and modules.
- Explain why state is needed and why it must be protected.
- Explain how you would investigate unexpected planned changes or configuration drift.
- Compare reusable modules with copied configuration.
- Describe how to review a plan and avoid unintended destructive changes.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] Reusable Terraform Module meets its acceptance criteria.
- [ ] Infrastructure Provisioning project meets its acceptance criteria, or its alternative clearly states the limitations.
- [ ] Formatting, validation, plan review, and state handling documented.
- [ ] Security and cleanup procedures documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to author, validate, review, and safely manage a small Terraform configuration and explain its state, planned changes, and cleanup requirements.

---

### Phase 9 — Ansible (2 Weeks)

**Learning Outcomes**
- Explain inventory, managed nodes, control nodes, and playbook execution.
- Write YAML playbooks using plays, tasks, modules, variables, and handlers.
- Use templates and roles to organize reusable configuration.
- Understand idempotence and how to verify the resulting system state.
- Manage privilege escalation and sensitive values appropriately.
- Troubleshoot connection, inventory, syntax, and task failures.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Repeatable Server Configuration

Write an Ansible playbook that applies a small set of configuration changes to a suitable test host or local lab environment.

**Acceptance Criteria**
- Define and document an inventory or target-host configuration.
- Use modules for the intended tasks rather than shell commands where suitable modules exist.
- Apply the playbook and verify the resulting system state.
- Run the playbook again and record whether it makes unnecessary changes.
- Document prerequisites, privilege requirements, and how failures are diagnosed.

---

### Independent Project — Automated Server Configuration

Create a reusable Ansible project for configuring one or more suitable Linux hosts.

**Acceptance Criteria**
- Include a documented inventory approach and clear playbook entry point.
- Automate a defined set of server configuration tasks, such as package installation, managed configuration files, and service state.
- Use variables and handlers where they improve maintainability.
- Organize reusable tasks into roles when appropriate.
- Demonstrate idempotence by running the playbook more than once and recording the results.
- Verify service and configuration state after execution.
- Handle privilege escalation and sensitive values safely; do not commit credentials.
- Document setup, execution, validation, troubleshooting, and recovery procedures.
- State any assumptions or limitations of the lab environment.

---

### Interview Readiness

- Explain inventories, playbooks, tasks, modules, variables, handlers, and roles.
- Explain idempotence and why it matters in configuration management.
- Describe how Ansible connects to managed hosts and uses privilege escalation.
- Diagnose common inventory, connectivity, YAML, and task failures.
- Explain how to protect secrets and structure reusable automation.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] Repeatable Server Configuration meets its acceptance criteria.
- [ ] Automated Server Configuration meets its acceptance criteria.
- [ ] Idempotence and resulting system state verified and documented.
- [ ] Security and troubleshooting procedures documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to automate and verify repeatable Linux server configuration with Ansible and explain how the automation can be safely maintained and troubleshot.

---

### Phase 10 — Monitoring & Logging (3 Weeks)

**Learning Outcomes**
- Explain the purpose of metrics, logs, dashboards, and alerts.
- Distinguish monitoring, observability, and centralized logging.
- Collect and interpret application or system metrics and logs using an appropriate toolset.
- Build dashboards that communicate service health and relevant trends.
- Configure actionable alerts with meaningful conditions and severity.
- Investigate an issue by correlating metrics, logs, and service behavior.
- Explain retention, access control, resource overhead, and sensitive-data considerations.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — Service Health Monitoring Lab

Instrument a small service or test workload and document how its health is assessed.

**Acceptance Criteria**
- Identify a small set of meaningful health indicators, such as availability, response time, errors, or resource usage.
- Collect relevant metrics or logs using an available monitoring tool or a clearly documented alternative.
- Create a dashboard or structured report that makes the chosen indicators understandable.
- Demonstrate a controlled failure or unhealthy condition and record the resulting evidence.
- Document how the issue is detected, investigated, and resolved.
- State which parts were actually tested and which are illustrative.

---

### Independent Project — Monitoring Platform

Build a reproducible monitoring and logging environment for a small application or lab workload.

**Acceptance Criteria**
- Document the architecture, components, data sources, and collection flow.
- Collect and display relevant metrics and logs.
- Provide a dashboard covering service health and at least one useful operational trend.
- Configure at least one meaningful alert or document a tested alerting alternative if the environment does not support notifications.
- Demonstrate an investigated failure or unhealthy condition using the collected evidence.
- Document how the system is deployed, verified, maintained, and cleaned up.
- Address retention, access control, sensitive data, and monitoring overhead.
- Include setup instructions, evidence, and known limitations.

---

### Interview Readiness

- Explain the differences between metrics, logs, and traces, and when each is useful.
- Describe how to choose useful service-health indicators and alert thresholds.
- Explain how dashboards and alerts support troubleshooting.
- Walk through an investigation that correlates an observed symptom with relevant logs and metrics.
- Discuss alert noise, retention, access control, and sensitive-data handling.
- Explain the monitoring platform's architecture and operational limitations.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] Service Health Monitoring Lab meets its acceptance criteria.
- [ ] Monitoring Platform meets its acceptance criteria.
- [ ] Dashboard, alerting, and troubleshooting evidence documented.
- [ ] Security, retention, and operational considerations documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to collect and interpret service-health data, investigate a problem using evidence, and explain the design and limitations of a small monitoring platform.

---

### Phase 11 — DevOps Security (2 Weeks)

**Learning Outcomes**
- Explain least privilege, defense in depth, and basic threat modeling.
- Identify common risks involving credentials, source control, build pipelines, container images, and deployment permissions.
- Manage secrets using suitable environment or platform mechanisms rather than committing them to source control.
- Understand dependency scanning, image scanning, and basic static checks.
- Apply appropriate access controls to repositories, automation, and deployment environments.
- Explain security findings, remediation priorities, and verification.
- Recognize that automated checks reduce risk but do not prove a system is secure.

### Recommended Resources

**Primary**
- DLOS Lessons

**Concept Reinforcement**
- Nana Janashia

**Hands-on**
- KodeKloud Labs

**Reference**
- Official Documentation

---

### Mini Project — DevOps Security Review

Perform a documented security review of a small sample repository or test application.

**Acceptance Criteria**
- Identify assets, trust boundaries, and plausible security risks.
- Inspect the project for accidental secret exposure and unsafe configuration.
- Run at least one appropriate security or dependency check where tooling is available.
- Record findings with severity or priority, evidence, and recommended remediation.
- Correct at least one safe, reproducible finding or document why remediation is outside the lab's scope.
- Verify the result after remediation and avoid publishing real secrets or sensitive test data.

---

### Independent Project — Secure Deployment Pipeline

Build or extend a test deployment pipeline with explicit security checks and documented access controls.

**Acceptance Criteria**
- Document the pipeline's trust boundaries, permissions, and sensitive inputs.
- Keep credentials out of source control and use a suitable secret-management mechanism.
- Include at least one relevant automated security check, such as dependency, source, or container-image scanning.
- Demonstrate how the pipeline handles a controlled test finding or failed security check.
- Document how findings are assessed, remediated, and verified.
- Apply least privilege to pipeline and deployment permissions where the platform permits.
- Explain approval gates and separation between test and deployment environments where applicable.
- Include setup instructions, validation evidence, limitations, and safe cleanup steps.
- Use test findings only; do not introduce real exploitable vulnerabilities or expose live credentials.

---

### Interview Readiness

- Explain least privilege, defense in depth, and basic threat modeling.
- Describe common ways secrets leak into repositories and pipeline logs.
- Explain what dependency, source, and image scanning can and cannot detect.
- Describe how to respond to a security finding in a pipeline.
- Explain how pipeline credentials and deployment permissions should be scoped.
- Discuss false positives, remediation verification, and the limitations of automated security checks.

---

### Definition of Done

- [ ] Learning outcomes reviewed and explained in your own words.
- [ ] Relevant hands-on labs completed with results recorded.
- [ ] DevOps Security Review meets its acceptance criteria.
- [ ] Secure Deployment Pipeline meets its acceptance criteria.
- [ ] Findings, remediation decisions, and verification evidence documented.
- [ ] Secret handling and access-control decisions documented.
- [ ] Interview-readiness checkpoints demonstrated.
- [ ] Relevant notes and reusable reference material updated.
- [ ] Learning tracker updated accurately.
- [ ] Documentation reviewed and included in a suitable repository update batch.

**Phase Exit Criteria:** Able to identify common DevOps security risks, apply appropriate preventive controls, and demonstrate how a security finding is investigated and verified.

---

### Phase 12 — Capstone Projects (4–6 Weeks)

**Purpose**

Integrate skills from Linux, networking, Git, Docker, Kubernetes, CI/CD, cloud infrastructure, Terraform, Ansible, monitoring, logging, and DevOps security into a documented, reproducible project.

**Capstone Selection**

Choose one primary end-to-end project based on the skills actually completed and the resources available. The existing project inventory in `PROJECTS.md` should guide selection. Avoid adding unnecessary technologies just to make the project appear more advanced.

**Expected Capstone Deliverables**
- A clearly defined problem statement, scope, and success criteria.
- An architecture diagram or equivalent architecture description.
- Version-controlled application, infrastructure, configuration, and pipeline files as applicable.
- Reproducible setup and deployment instructions.
- Validation evidence showing which components and workflows were actually tested.
- Monitoring, logging, troubleshooting, and recovery documentation appropriate to the implementation.
- Security considerations, secret-handling decisions, and known limitations.
- A cost estimate and cleanup procedure if cloud resources are used.
- A final README suitable for a technical reviewer.
- A retrospective describing design decisions, trade-offs, failures, lessons learned, and future improvements.

### Capstone Milestones

1. **Scope and design:** Define the problem, architecture, constraints, deliverables, and acceptance criteria.
2. **Build:** Implement the core application or workload and required infrastructure.
3. **Automate:** Add suitable configuration management and CI/CD automation.
4. **Operate:** Verify deployment, inspect logs and metrics, and investigate a controlled failure.
5. **Review:** Evaluate security, reproducibility, maintainability, cost, and cleanup.
6. **Present:** Complete documentation, gather evidence, and prepare a concise technical walkthrough.

### Capstone Acceptance Criteria

- [ ] The project solves a clearly stated problem.
- [ ] The implementation aligns with the documented architecture and scope.
- [ ] Setup and deployment instructions have been tested to the extent claimed.
- [ ] Automation and configuration are version-controlled where appropriate.
- [ ] At least one failure or recovery scenario has been investigated and documented.
- [ ] Relevant operational and security considerations are addressed.
- [ ] Limitations and unimplemented components are explicitly identified.
- [ ] Cloud resources, if any, have a documented cost and cleanup plan.
- [ ] A reviewer can understand the design, validation evidence, and key trade-offs.
- [ ] The project status and learning tracker accurately reflect the work completed.

**Phase Exit Criteria:** Able to present and defend an end-to-end DevOps implementation, explain its design choices, demonstrate the work performed, and clearly identify its limitations.

---

### Phase 13 — Career Preparation & Specialization (Ongoing)

**Purpose**

Turn the skills and project evidence developed throughout the roadmap into a credible professional portfolio and a sustainable learning plan.

**Career Preparation Areas**
- Maintain an accurate, well-organized GitHub portfolio with clear project READMEs.
- Explain technical decisions, trade-offs, troubleshooting methods, and lessons learned from completed projects.
- Practice Linux, networking, Git, containers, Kubernetes, CI/CD, cloud, infrastructure as code, automation, monitoring, and security interview topics as applicable to completed learning.
- Prepare concise explanations of project architecture, implementation, failures, and outcomes.
- Identify skill gaps from interview practice and project reviews.
- Choose a specialization based on demonstrated interests, practical experience, and target-role requirements.

### Portfolio Acceptance Criteria

- [ ] Important projects have clear problem statements, architecture, setup instructions, and validation evidence.
- [ ] Project status accurately distinguishes completed work from planned or partially implemented work.
- [ ] READMEs identify prerequisites, configuration, limitations, and cleanup steps where applicable.
- [ ] No credentials, tokens, private keys, or other sensitive information are committed.
- [ ] Git history and documentation are understandable to an external reviewer.
- [ ] At least one completed project can be explained from design through troubleshooting and lessons learned.

### Interview Preparation

- Practice explaining concepts in your own words rather than relying on memorized definitions.
- Solve scenario-based troubleshooting questions and explain the reasoning behind each diagnostic step.
- Review relevant project code, configuration, architecture, and validation evidence before discussing a project.
- Record difficult questions and use them to guide targeted revision.
- Do not claim production experience or project results that the evidence does not support.

### Specialization Plan

Select a specialization only after gaining enough practical exposure to compare the options. Possible directions include cloud engineering, Kubernetes and platform engineering, infrastructure automation, CI/CD, observability, and DevOps security.

For the selected direction:
- Define the target role and the skills it requires.
- Compare those requirements with the current learning tracker and portfolio evidence.
- Identify a small set of focused gaps and a practical project or exercise for each.
- Reassess the plan periodically rather than expanding the curriculum without a clear goal.

### Definition of Done

This is an ongoing phase rather than a one-time completion gate.

- [ ] Portfolio and project documentation reviewed periodically.
- [ ] Interview practice and knowledge gaps recorded.
- [ ] Resume and professional profiles accurately reflect demonstrated skills.
- [ ] Target-role requirements reviewed before choosing further learning priorities.
- [ ] Specialization goals and next actions documented.
- [ ] Portfolio claims remain consistent with completed work and available evidence.

**Phase Exit Criteria:** Maintain a credible portfolio, communicate technical decisions clearly, identify and address skill gaps, and pursue a focused professional development path.

---

# 8. Learning Methodology

Learn → Understand → Practice → Experiment → Document → Reflect → Commit → Track Progress

# 9. Projects

- Mini Projects
- Phase Projects
- Capstone Projects

# 10. Milestones

Repository Foundation
Linux
Networking
Git
Docker
Kubernetes
CI/CD
AWS
Terraform
Ansible
Monitoring
Security
Capstone

# 11. Progression Rules

Advance only after:
- Objectives met
- Deliverables complete
- Knowledge Book updated
- Tracker updated
- Definition of Done satisfied

# 12. External Resources

- TechWorld with Nana
- KodeKloud
- Official Documentation

# 13. Completion Criteria

The DevOps learning journey is complete when:

- All learning phases satisfy their documented phase exit criteria.
- Required hands-on work and applicable phase projects meet their acceptance criteria.
- Project implementation and verification evidence is documented.
- Required learning artifacts and Knowledge Book references are maintained.
- The Learning Tracker accurately reflects completed work and remaining gaps.
- The portfolio presents the work honestly, including known limitations and unfinished items.

The phase-specific exit criteria in this roadmap are authoritative; this overall criterion does not replace them.

# 14. Long-Term Goals

Become a professional DevOps Engineer with a production-ready portfolio.

# 15. Future Expansion

Azure, GCP, GitOps, MLOps, Platform Engineering.

# 16. Version History

| Version | Date | Description |
|----------|------|-------------|
| 1.2.0 | 2026-10-23 | Clarified overall completion criteria and aligned project acceptance and evidence expectations. |
| 1.1.0 | 2026-10-22 | Expanded phase learning outcomes, project acceptance criteria, interview-readiness checkpoints, and definitions of done across the roadmap. |
| 1.0.0 | Not recorded | Initial curriculum release. |

## Related Documents

- DLOS.md
- LEARNING_TRACKER.md
- SYSTEM_CHANGELOG.md
