# Introduction to Swarm

Swarm is a server clusering solution which brings hosts or nodes into a single manageable unit, which can then orchestrate the lifecycle of your containers.
- By default swarm is not enabled by default.

> Swarm has manager nodes and worker nodes. The manager nodes have databases locally called the Raft Database. This stores their
config in the swar. They are also responsible for encrypting traffic to ensure integrity. A manager is basically a worker with permission to control the swarm.

The worker and managers represent vms, hosts, or distro's of linux or windows servers. Both of these work on a control plane.

Docker service (replaces docker run for swarm), allows a single service to run multiple tasks, each task launching a container.

---

## Manager nodes

Manager nodes determine where to place replicas of the tasks. It works with the RAFT workflow which consists of the SWARM API.

- **API**: Accepts command from client and creates service object
- **Orchestrator**: Recon loop for service objects and creates tasks (The orcherstrator issues orders down to the workers to )
- **Allocator**: Allocates IP addresses to tasks
- **Scheduler**: Assigns nodes to tasks
- **Dispatcher**: Checks in on workers 

---

## Worker nodes 

Reports to the manager and asks for new work.

- **Worker**: connects to dispatcher to check on assigned tasks 
- **Executor**: executes tasks assigned to worker node 

---

## Raft

Raft is a protocol for implementing distibuted consensus




 