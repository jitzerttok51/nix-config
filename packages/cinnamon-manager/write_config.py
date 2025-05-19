import sys

try:
    # Use 'with open' to ensure the file is properly closed after writing.
    with open(".hello_python", 'w') as f:
        f.write(sys.argv[1])  # Write the text to the file.
    print(f"File 'hello_python' created successfully")
except OSError as e:
    # Catch OS-related errors (e.g., file not found, permission issues).
    print(f"Error creating file: {e}")
except Exception as e:
    # Catch any other unexpected errors.
    print(f"An unexpected error occurred while creating file: {e}")
