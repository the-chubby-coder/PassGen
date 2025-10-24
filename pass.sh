#!/bin/bash
clear
echo "Welcome to PassGen where you generate a random password that is very secure and usable"
sleep 2
echo "press any key to generate a password"
read -n 1
clear
# Define character sets
letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
symbols="!@#$%^&*"
numbers="0123456789"

# Generate 8 random letters
letter_part=$(cat /dev/urandom | tr -dc "$letters" | head -c 8)

# Generate 4 random numbers
number_part=$(cat /dev/urandom | tr -dc "$numbers" | head -c 4)

# Generate 4 random symbols
symbol_part=$(cat /dev/urandom | tr -dc "$symbols" | head -c 4)

# Combine and shuffle all parts
password="$letter_part$number_part$symbol_part"
shuffled_password=$(echo "$password" | fold -w1 | shuf | tr -d '\n')

# Copy the raw password (without ANSI codes) to the clipboard
echo -n "$shuffled_password" | xclip -selection clipboard

# Format the entire password to be bold and red for display
formatted_password="\033[1;31m$shuffled_password\033[0m"

# Output the final 16-character password
echo -e "Your password: $formatted_password"
echo "Password has been copied to the clipboard!"
sleep 4
clear
echo "press any button to restart passgen"
read -n 1
clear
bash "$0"
