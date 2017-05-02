# Most of the build configuration variables have sensible defaults or are calculated from the
# following variables when omrakelib-ios is set up.
#
# A full list of variables is available in the README.md file in the omrakelib-ios git repo.
# They can be overriden by defining them here.

module ProjectConfig
  BUILD_DIR                     = "build"
  BUILD_CHANGELOG               = "#{BUILD_DIR}/changelog.md"

  BUILD_CONFIG_DEV              = "OMQA"
  BUILD_CONFIG_OMQA             = "OMQA"

  CERT_CLIENT_DISTRIBUTION      = ""    # iPhone Distribution:
  CERT_OUTWARE_DEV              = ""    # iPhone Distribution:
  CERT_OUTWARE_DISTRIBUTION     = ""    # iPhone Distribution:
  CERT_OUTWARE_DROP_CLIENT      = ""    # iPhone Distribution:

  ENDPOINT_MANAGER_CONFIGS      = []

  HOCKEYAPP_API_TOKEN           = ""
  HOCKEYAPP_API_TOKEN_DROP_SAND = ""
  HOCKEYAPP_API_TOKEN_DROP_PROD = ""

  PROJECT_NAME                  = "OMProject"
  PROJECT_PRODUCT_NAME          = "OMProject"
  PROJECT_APPICONSET            = "#{PROJECT_NAME}/Images.xcassets/AppIcon.appiconset"
  PROJECT_INFO_PLIST            = "#{PROJECT_NAME}/Info.plist"

  VALIDATION_BUNDLE_ID          = "au.com.outware.OMProject"
end
