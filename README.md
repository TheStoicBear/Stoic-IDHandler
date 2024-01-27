## Stoic-IDHandler 


## User Documentation

### Configuration

To configure the Stoic-IDHandler system, follow these steps:

1. Open the `Config.lua` file.
2. Adjust the configuration parameters according to your application's requirements:

   - **License Location**: Define the location where players can buy the license.
   - **License Price**: Set the price of the driver's license.
   - **Notification Configuration**: Customize default notification settings such as duration, position, and icon.
   - **Notification Types**: Define notification types and their corresponding icon classes.
   - **Departments**: Define the department names for user permissions and commands.

### Usage

The Stoic-IDHandler system consists of three main components: Client-side, Server-side, and Configuration.

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
