# Read-HostWithTimeout

This function provides a prompt to the user and waits for input within a specified timeout period.

## Parameters

- `Prompt`: A string that is displayed as a message to the user. The default message is "Press any keys to continue... ".
- `PromptBackGroundColor`: The background color of the prompt. The default color is the background color of the host's UI.
- `PromptForeGroundColor`: The foreground color of the prompt. The default color is the foreground color of the host's UI.
- `Timeout`: The time (in seconds) that the function waits for user input before timing out. The default timeout is 5 seconds.
- `TimeoutHint`: A string that is displayed when the function times out. The default message is "Timeout".
- `HintBackgroundColor`: The background color of the timeout hint. The default color is the background color of the host's UI.
- `HintForeGroundColor`: The foreground color of the timeout hint. The default color is yellow.

## Usage

The function displays a prompt to the user and waits for input. If no input is received within the specified timeout period, it displays a timeout hint and ends.

Note: The `Timeout` parameter runs in milliseconds, so it's multiplied by 1000 to convert from seconds to milliseconds.

## Working version

**Below is the version for the script to work with**

| Name                      | Value                 |
|---------------------------|-----------------------|
| PSVersion                 | 5.1.19041.2673        |
| PSEdition                 | Desktop               |
| PSCompatibleVersions      | {1.0, 2.0, 3.0, 4.0...} |
| BuildVersion              | 10.0.19041.2673       |
| CLRVersion                | 4.0.30319.42000       |
| WSManStackVersion         | 3.0                   |
| PSRemotingProtocolVersion | 2.3                   |
| SerializationVersion      | 1.1.0.1               |
