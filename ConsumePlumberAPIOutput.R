# [OPTIONAL] Initialization, Install and load the required packages ----
if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

if (require("httr")) {
  require("httr")
} else {
  install.packages("httr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

if (require("jsonlite")) {
  require("jsonlite")
} else {
  install.packages("jsonlite", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# Generate the URL required to access the symptoms-based API ----
base_url_symptoms <- "http://127.0.0.1:5022/symptoms"

params_symptoms <- list(Symptom_1 = "symptom1_value",
                        Symptom_2 = "symptom2_value",
                        Symptom_3 = "symptom3_value",
                        Symptom_4 = "symptom4_value",
                        Symptom_5 = "symptom5_value",
                        Symptom_6 = "symptom6_value",
                        Symptom_7 = "symptom7_value",
                        Symptom_8 = "symptom8_value")

query_url_symptoms <- httr::modify_url(url = base_url_symptoms, query = params_symptoms)
print(query_url_symptoms)

# Make the request for the symptoms-based prediction through the API ----
model_prediction_symptoms <- GET(query_url_symptoms)
content(model_prediction_symptoms)
content(model_prediction_symptoms)[[1]]

# Parse the response into the right format ----
model_prediction_raw_symptoms <- content(model_prediction_symptoms, as = "text",
                                         encoding = "utf-8")
jsonlite::fromJSON(model_prediction_raw_symptoms)

# Enclose everything in a function ----
get_symptoms_predictions <- function(Symptom_1, Symptom_2, Symptom_3, Symptom_4,
                                     Symptom_5, Symptom_6, Symptom_7, Symptom_8) {
  base_url_symptoms <- "http://127.0.0.1:5022/symptoms"
  params_symptoms <- list(Symptom_1 = Symptom_1, Symptom_2 = Symptom_2,
                          Symptom_3 = Symptom_3, Symptom_4 = Symptom_4,
                          Symptom_5 = Symptom_5, Symptom_6 = Symptom_6,
                          Symptom_7 = Symptom_7, Symptom_8 = Symptom_8)
  query_url_symptoms <- modify_url(url = base_url_symptoms, query = params_symptoms)
  model_prediction_symptoms <- GET(query_url_symptoms)
  model_prediction_raw_symptoms <- content(model_prediction_symptoms, as = "text", encoding = "utf-8")
  jsonlite::fromJSON(model_prediction_raw_symptoms)
}

# Model prediction based on symptoms parameters
get_symptoms_predictions("symptom1_value", "symptom2_value", "symptom3_value",
                         "symptom4_value", "symptom5_value", "symptom6_value",
                         "symptom7_value", "symptom8_value")
