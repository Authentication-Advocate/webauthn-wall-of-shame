#!/usr/local/bin/python

import os
import yaml
from datetime import date

# set directory of config files as variable
directory = '/configs/'

# little function for validating a vendor record
def validate_vendor(vendor):
    # validate name attribute
    # confirm attribute exists
    if "name" not in vendor:
        raise Exception('No "name" attribute for vendor!')
    # confirm value exists and isn't empty space
    if not vendor["name"] or vendor["name"].isspace():
        raise Exception('"name" attribute for vendor is blank!')

    # validate url attribute
    # confirm attribute exists
    if "vendor_url" not in vendor:
        raise Exception(f'No "vendor_url" attribute for {vendor["name"]}!')
    # confirm value exists and isn't empty space
    if not vendor["vendor_url"] or vendor["vendor_url"].isspace():
        raise Exception(f'"vendor_url" for {vendor["name"]} is blank!')

    # validate update_at attribute
    # confirm attribute exists
    if "updated_at" not in vendor:
        raise Exception(f'No "updated_at" attribute for {vendor["name"]}!')
    # confirm value exists and is a date
    if not vendor["updated_at"] or not isinstance(vendor["updated_at"], date):
        raise Exception(f'"updated_at" for {vendor["name"]} is not a date!')

    # validate attributes that don't require a value
    if not all(required_attribute in vendor for required_attribute in ("ios_app","android_app", "windows_client", "mac_client", "linux_client", "test_results")):
        raise Exception(f"You seem to have removed an attribute from the template YAML file. All attributes are required, even if a value is not required.")
    # report success
    print(f'Configuration for {vendor["name"]} looks valid!')

# iterate over all files in config directory
for filename in os.listdir(directory):
    full_path = os.path.join(directory, filename)
    # check if it's a file
    if os.path.isfile(full_path):
        with open(full_path, 'r') as file:
            vendor = yaml.safe_load(file)
            try:
                validate_vendor(vendor)
            except Exception as exception:
                print(f"Problem with {filename}: {exception}")
                raise