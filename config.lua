Config = {}

Config.LicenseLocation = vector3(1897.36, 3685.02, 33.12)-- Define the location where players can buy the license
Config.LicensePrice = 100-- Price of the driver's license
Config.DefaultDuration = 5000 -- Default duration for notifications in milliseconds (5 seconds)
Config.DefaultPosition = "top" -- Default position of notifications on the screen
Config.DefaultIcon = "fas fa-bell" -- Default icon for notifications
Config.DefaultAlignIcon = "center" -- Default alignment of the icon within the notification


-- Define notification types and their corresponding icon classes
Config.NotificationTypes = {
    success = "fas fa-check-circle",
    error = "fas fa-exclamation-circle",
    warning = "fas fa-exclamation-triangle",
    info = "fas fa-info-circle"
}

-- Define the department names
Config.Departments = {
    "sasp",
    "doa",
    "lscso",
    -- Add more department names as needed
}
