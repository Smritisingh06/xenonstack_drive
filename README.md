# xenonstack_drive
General instructions
1. The approach of solving the Problem solely depends on the Candidate
2. Make sure to have Draw.io diagrams for the workflowns and application architecture
3. Every configuration, code written should be pushed on git (Private Repo)
4. Your are not permitted to share the doc with anyone, even with your colleagues
Scenario There is a customer who came to you with a problem to have a custom linux
command for his operations. Your task is to understand the problem and create a linux
command via bash script as per the instructions.
$ internsctl cpu getinfo
Linux command script work:

Section A: 
1. I want a manual page of command so that I can see the full documentation of the command.
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/f39ac690-0c02-49b4-89ce-412f2b686fc0)

2. Each linux command has an option --help which helps the end user to understand the use
cases via examples. Similarly if I execute internsctl --help it should provide me the
necessary help

![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/cb5b46fd-45ac-483b-bc9a-c72f6163955a)


3. I want to see version of my command by executing
internsctl --version

![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/4978fb05-0e75-46ab-80ec-598af373c4f8)


Section B: 
Part 1:  
1. I want to get cpu information of my server through the following command:
$ internsctl cpu getinfo
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/765b0e7d-1ca3-49b8-979c-9667228710ff)

2. I want to get memory information of my server through the following command:
$ internsctl memory getinfo
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/bd76524b-fb90-4c57-979d-77b6fd0b6cc5)

Part 2:
1. I want to create a new user on my server through the following command:
$ internsctl user create <username>
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/0036d164-ccb2-408c-bbb3-cc638078b338)


2. I want to list all the regular users present on my server through the following command:
$ internsctl user list
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/06fcd6d3-f45a-4aa9-8c11-a82a38f6d9ab)


3.If want to list all the users with sudo permissions on my server through the following command:
$ internsctl user list --sudo-only
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/9b24bdb2-c644-4486-9610-989346e6cc8d)


Part 3:  Advanced level
 1. By executing below command I want to get some information about a file
$ internsctl file getinfo <file-name>
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/e59c7669-9ba5-45bb-b264-00c5ee3d726e)

3. 
In case I want only specific information then I must have a provision to use options
$ internsctl file getinfo [options] <file-name>
i) --size, -s to print size
    ![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/ec82b052-0cc7-45e1-b1f3-203a520ef67b)
   
ii) --permissions, -p print file permissions
 ![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/e37eb2a1-0623-4d94-8cf5-3d850ded8a29)

iii) --owner, o print file owner

 ![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/17feff92-e88a-41fd-b9cb-a70f45efb006)

iv) --last-modified, m
![image](https://github.com/Smritisingh06/xenonstack_drive/assets/143263123/5f8ed9d7-4aeb-4fa3-a5e6-2663916f2bcb)


