# NotBad Recruiting - SENIOR DEVOPS ENGINEER

This is a test project within NotBad's technical recruiting process.

In doubt of technical issues you can send an e-mail with your questions.

## Preconditions

### Technical & Knowledge
You need at least:

* Experience with AWS stack
* Experience with CI/CD
* Experience with Bash scripts
* Experience in at least one programming language (Java, Python, PHP, Perl, etc.)
* A text editor of your choice

## The tasks
1) You have log file somesite.log

   * Analyse it and find bad actors.
   * What do you think is the most dangerous request here and why?
   * Write commands you use to analyse.

2) Make code review for auth.php

3) Provide infrastructure and create CI/CD with a web app that will listen 8089 port and return "ReallyNotBad" string when POST request contains header "NotBad" with value "true", eg. curl -X POST -H "NotBad: true" https://someurl:8089/ should return "ReallyNotBad".
Use any technology you want to deploy the application to AWS. It can be Ansible, Terraform, etc. or a combination of some of them.
Hint: https://aws.amazon.com/free/