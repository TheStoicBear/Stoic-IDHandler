![STOIC (7)](https://github.com/TheStoicBear/Stoic-IDHandler/assets/112611821/318291df-ee38-480c-b565-9459d946848e)

<p align="center">
  <a href="https://thestoic.gitbook.io/home/docs/stoic-idhander">Documentation Page</a>
</p>



## Stoic IDHandler User Documentation


### Introduction

Stoic IDHandler is a user identification management system designed to handle authentication, authorization, and license management within FiveM. This system provides a robust and secure solution for managing user identities.

### Configuration

To configure the NDFramework IDHandler system, follow these steps:

1. Open the `Config.lua` file.
2. Adjust the configuration parameters according to your application's requirements:

   - **License Location**: Define the location where players can buy the license.
   - **License Price**: Set the price of the driver's license.
   - **Notification Configuration**: Customize default notification settings such as duration, position, and icon.
   - **Notification Types**: Define notification types and their corresponding icon classes.
   - **Departments**: Define the department names for user permissions and commands.

### Usage

The NDFramework IDHandler system consists of three main components: Client-side, Server-side, and Configuration.

#### Client-Side (Client.lua)

The client-side script manages user interactions and notifications. It includes the following functionalities:

- Displaying notifications to users based on server events.
- Handling user interactions to buy a driver's license.

#### Server-Side (Server.lua)

The server-side script handles server events and database interactions. It includes the following functionalities:

- Sending notifications to clients.
- Processing commands to revoke, suspend, or mark a driver's license as valid.
- Handling the event to buy a driver's license.

#### Configuration (Config.lua)

The configuration file defines various parameters used by the system, including:

- License location and price.
- Default notification settings.
- Notification types and icons.
- Department names for user permissions and commands.

### Commands

Here are the commands available for users:

- **/revokedl [playerId]**: Revoke a driver's license for the specified player.
- **/suspenddl [playerId]**: Suspend a driver's license for the specified player.
- **/validdl [playerId]**: Mark a driver's license as valid for the specified player.

### Details

- **/revokedl [playerId]**:
  - Command to revoke a driver's license for a specific player.
  - Requires appropriate permissions based on department names defined in the configuration.
  - Usage: `/revokedl [playerId]`

- **/suspenddl [playerId]**:
  - Command to suspend a driver's license for a specific player.
  - Requires appropriate permissions based on department names defined in the configuration.
  - Usage: `/suspenddl [playerId]`

- **/validdl [playerId]**:
  - Command to mark a driver's license as valid for a specific player.
  - Requires appropriate permissions based on department names defined in the configuration.
  - Usage: `/validdl [playerId]`
