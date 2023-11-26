1# Check if renv package is available and initialize it if needed
if (!require("renv")) {
  install.packages("renv", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
} else {
  renv::init() # Initialize renv
}

# Check and install plumber package
if (!require("plumber")) {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
} else {
  library(plumber)
}

# Load the Plumber API file
#api <- plumber::plumb("C:/Users/Kaguash/github-classroom/20230821-20231128-BI2-BBIT4-2/BBT4206-R-Lab13of15-RunPlumberAPI-certificate/PlumberAPI.R")  # Replace with your API file path
api <- plumber::plumb("PlumberAPI.R")

# Run the API on a specific host and port
api$run(host = "127.0.0.1", port = 5022)

# Perform tests on the API (optional)

# Take a snapshot of the R environment
# renv::snapshot() # Uncomment and execute this at the end if needed
