What?
=====

A Docker Composed based Choria environment with:

 * Choria Broker
 * Choria Provisioner
 * Choria AAA Server
 * Choria Server
 * Choria Client

This demonstrates an upcoming deployment method that does not rely on
Certificate Authorities or mTLS for security.

Instead we developed an ed25519 based security system that is now in
use by Servers, Clients, Provisioning and AAA this removes the need
for Certificate Authorities while significantly enhancing the features
of the security system

Primarily this demonstrates the work in [issue #1740](https://github.com/choria-io/go-choria/issues/1740)
as documented in the [ADR](https://github.com/choria-io/go-choria/blob/main/protocol/v2/ADR.md).

There is no Puppet anywhere on this setup, it's self provisioning and
self configuring. This will form the basis of deployments in Enterprises
and in Kubernetes environments where we cannot rely on Puppet.

Status?
=======

As mentioned this is our test bed for playing with in-flight work, as
such we cannot guarantee this setup will remain stable.

These features are likely to see a release in January 2023 in Choria 0.27.0.

Requirements?
=============

You need docker with docker compose, this probably only works on Linux and Macs.

Setup?
======

- run "./pki.sh" to setup the certs
- `docker compose exec client.choria choria ping --debug`
- watch it hang?
