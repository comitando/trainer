#! /usr/bin/env bash

# Builds the Swift package in release mode
swift build -c release --package-path "automation" --product "Automations"

# Checks if the build was successful
if [ $? -ne 0 ]; then
    echo -e "\033[31mFailed to build the Swift package.\033[0m" # Red color
    exit 1
fi

read -p "Digite o tipo de automação: (ex: module): " type

if [ $1 == "module" ]; then
    automation/.build/release/Automations $1 $2 $3 $4
fi

# Captures the exit code of the Swift executable
exit_code=$?

if [ $exit_code -eq 0 ]; then
    echo -e "\033[32mScript executed successfully.\033[0m" # Green color
else
    echo -e "\033[31mScript execution failed.\033[0m" # Red color
fi

# Exits with the same exit code as the Swift executable
exit $exit_code