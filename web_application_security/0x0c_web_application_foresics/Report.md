# Web Application Forensics Report

## Introduction
In cybersecurity, understanding and mitigating the risks associated with web application vulnerabilities is crucial. This report is the first entry in a comprehensive series on web application forensics, in which we explore the essential principles and strategies that can protect technology-enabled organizations against cyberthreats.

Analyzing web application logs allows for the identification of attacks and the development of protective strategies.

## Incident Report
**Summary of Findings:**
The targeted system (Ubuntu 2.6.24-26-server) was compromised through a brute-force attack on the SSH service (`sshd`). 

**Impacts:**
- **Service Compromised:** `sshd` was the primary entry point.
- **Unauthorized Access:** 18 distinct attackers successfully gained `root` access to the system.
- **Account Persistence:** Several unauthorized user accounts were created to maintain access, including `Jax`, `Nidalee`, `Senna`, `Aphelios`, and `Fido`.
- **System Modification:** The attackers modified the system's firewall (`ufw`) to allow traffic on non-standard ports (e.g., 0303, 2685, 113), likely for command and control (C2) or additional backdoors.

## Implementation Plan
To remediate the current compromise and prevent future incidents, the following steps will be taken:
1. **Immediate Access Revocation:** Change passwords for all legitimate users and terminate all active SSH sessions.
2. **Account Cleanup:** Remove all unauthorized user accounts identified in the forensics phase.
3. **Firewall Hardening:** Audit and reset `ufw` rules, closing all ports that are not strictly necessary for business operations (specifically ports 0303, 2685, and 113).
4. **SSH Hardening:**
    - Disable `root` login via SSH (`PermitRootLogin no`).
    - Implement SSH key-based authentication and disable password authentication.
    - Change the default SSH port (22) to a non-standard port.
5. **System Updates:** Update the operating system and all installed packages to patch known vulnerabilities.

## Monitoring Protocol
Guidelines for ongoing evaluation of security measures:
1. **Log Auditing:** Implement automated log analysis scripts to flag frequent "Failed password" or "Accepted password" entries in `auth.log`.
2. **Intrusion Detection:** Deploy an Intrusion Detection System (IDS) like Fail2Ban to automatically block IPs that exhibit brute-force behavior.
3. **Integrity Checks:** Regularly verify the integrity of system binaries and monitor for unauthorized changes to configuration files (e.g., `/etc/passwd`, `/etc/shadow`).
4. **Periodic Review:** Conduct monthly security audits to review firewall rules and user access levels.
