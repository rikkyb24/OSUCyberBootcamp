# OSUCyberBootcamp
A Collection of Projects and Scripts from my Cybersecurity BootCamp at Ohio State University

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Diagrams/networkdiagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, you can select portions of the files in the Ansible folder to install only certain pieces of it, such as Filebeat.

  

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system metrics.


The configuration details of each machine may be found below.


| Name                 | Function | IP Address                               | Operating System |
|----------------------|----------|------------------------------------------|------------------|
| Jump Box Provisioner | Gateway  | 20.97.227.146 -Public 10.0.0.5 - Private | Linux            |
| Virtual Machine 1    | Server   | 10.0.0.6                                 | Linux            |
| Virtual Machine 2    | Server   | 10.0.0.7                                 | Linux            |
| Virtual Machine 3    | Server   | 10.0.0.8                                 | Linux            |
| Virtual Machine 4    | Server   | 10.0.0.9                                 | Linux            |
| ELK                  | NSM      | 20.155.237.6                             | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box and the ELK machine can accept connections from the Internet. Access to these machines is only allowed from the following IP address:
 - 162.179.22.32
 
Machines within the network can only be accessed by other machines within the private internal network.


A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses                 |
|----------------------|---------------------|--------------------------------------|
| Jump Box Provisioner | Yes                 | 162.179.22.32:22 10.0.0.6-10.0.0.9   |
| Virtual Machine 1    | NO                  | 10.0.0.5 - 10.0.0.9                  |
| Virtual Machine 2    | NO                  | 1010.0.0.5-10.0.0.9                  |
| Virtual Machine 3    | NO                  | 10.0.0.5-10.0.0.9                    |
| Virtual Machine 4    | NO                  | 10.0.0.5-10.0.0.9                    |
| ELK                  | Yes                 | 162.179.22.32:5601 10.0.0.5-10.0.0.9 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because we could use this same configuration to deploy containers on a large number of machines simultaneously, if the need should arise.

The playbook implements the following tasks:

- Installs Docker Image for running containers
- Installs packages used for Python
- Installs Python client for Docker (required by Ansible to control containers) 
- Increases the alloacted memory space so that Elk can run efficiently once installed
- Pulls an image of Elk container version 7.6.1 
- Installs Elk 
- Ensures that the container is restarted each time the Virtual Machine reboots

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance:

Diagrams/Project_Successful_ELK

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Virtual Machine 1 10.0.0.6
- Virtual Machine 2 10.0.0.7
- Virtual Machine 3 10.0.0.8
- Virtual Machine 3 10.0.0.9

We have installed the following Beats on these machines:
- filebeat
- metricbeat

These Beats allow us to collect the following information from each machine:
1) Filebeat- as an agent running to monitor log files, filebeat will track changes to the system including: logins, failed-attempts, password changes, sudo-commands, etc 
2) Metricbeat- will periodically monitor the metrics (storage space, CPU, ram availibility, or other data related information) of an operating system or running service

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/files
- Update the /etc/ansible/hosts file to include the IP address of the target VM's
- Run the playbook, and navigate to  http://[your.VM.IP]:5601/app/kibana to check that the installation worked as expected.

