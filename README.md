# Windows Services Toolbox (Azure Devops task)
Toolbox of tasks to manage windows services.

------

Are these devops extensions helping you? 

[![](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BSMTZP9VKP8QN)

### Details

With these tasks you will have a toolbox to manage the windows services on the target machine.
In Windows NT operating systems, a Windows service is a computer program that operates 
in the background. It is similar in concept to a Unix daemon. A Windows service must conform to the interface rules and protocols
of the Service Control Manager, the component responsible for managing Windows services.

Windows services can be configured to start when the operating system is started and run in the background as long as Windows is running.
Alternatively, they can be started manually or by an event. Windows NT operating systems include numerous services which run in context of three 
user accounts: System, Network Service and Local Service. These Windows components are often associated with Host Process for Windows Services. 
Because Windows services operate in the context of their own dedicated user accounts, they can operate when a user is not logged on.


### Create Windows Service
Creates a new windows service on the target machine.

### Options

- **Service Name:** Name of the Windows Service.
- **Display Name:** The friendly/display name of the Windows Service.
- **Path to exe file:** The full path to the exe file that will be created as a service.
- **Description:** Description of the Windows Service.
- **Startup type:** The startup type of the service. Choose from:
  - Automatic
  - Automatic (Delayed Start)
  - Manual
  - Disabled
- **Log on as:** Type of user to log on. Choose from:
    - Local System account
    - Custom Account
- **Username:** The username of the user running the service.
- **Password:** The password of the user running the service.


### Start Windows Service
Starts the windows service.
### Options
- **Service Name:** Name of the Windows Service (this is not always the display name).

### Stop Windows Service

### Options
- **Service Name:** Name of the Windows Service (this is not always the display name).
