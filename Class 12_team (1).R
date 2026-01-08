install.packages("openxlsx")

library(openxlsx)


library(readxl)

data.BRE <- read_excel(file.choose(), sheet = 2, col_names = TRUE)

# Log-transforming the target variable
lnPrice <- log(data.BRE$`Price             [euros]`)
model_transformed <- lm(lnPrice ~ ., data = data.BRE)

# View the model summary
summary(model_transformed)

data.BRE$`City Zone` <- as.factor(data.BRE$`City Zone`)

# Rebuild the model excluding non-significant variables
model_refined <- lm(lnPrice ~ 
                      `City Zone` + 
                      `m^2` + 
                      Rooms + 
                      Elevator + 
                      `"Atico"` + 
                      Terrasse, 
                    data = data.BRE)

# Check the summary of the refined model
summary(model_refined)

# Rebuild the model again excluding non-significant variables
model_refined2 <- lm(lnPrice ~ 
                      `City Zone` + 
                      `m^2` + 
                      Rooms + 
                      Elevator + 
                      Terrasse, 
                    data = data.BRE)

# Check the summary of the refined model
summary(model_refined2)

# Drop the non-significant levels from 'City Zone'
data.BRE$`City Zone` <- factor(data.BRE$`City Zone`, 
                               levels = setdiff(levels(data.BRE$`City Zone`), 
                                                c('Gràcia', 'Horta - Guinardó', 'Sants - Montjuïc', '"Atico"')))

# Rebuild the model with the filtered levels of 'City Zone'
model_refined3 <- lm(lnPrice ~ 
                      `City Zone` + 
                      `m^2` + 
                      Rooms + 
                      Elevator + 
                      Terrasse, 
                    data = data.BRE)

# Check the summary of the refined model
summary(model_refined3)

# Remove the non-significant levels ('Sant Andreu' and 'Sant Marti') from 'City Zone'
data.BRE$`City Zone` <- factor(data.BRE$`City Zone`, 
                               levels = setdiff(levels(data.BRE$`City Zone`), 
                                                c('Sant Andreu', 'Sant Marti')))

# Rebuild the model excluding the non-significant 'City Zone' levels
model_refined4 <- lm(lnPrice ~ 
                      `City Zone` + 
                      `m^2` + 
                      Rooms + 
                      Elevator + 
                      Terrasse, 
                    data = data.BRE)

# Check the summary of the refined model
summary(model_refined4)

# Rebuild the model excluding 'Elevator'
model_refined5 <- lm(lnPrice ~ 
                       `City Zone` + 
                       `m^2` + 
                       Rooms + 
                       Terrasse, 
                     data = data.BRE)

# Check the summary of the refined model
summary(model_refined5)

library(readxl)

# Load the training data (ensure you're using the correct file path)
data.BRE <- read_excel(file.choose(), sheet = 2, col_names = TRUE)

# Log-transforming the target variable for training
lnPrice <- log(data.BRE$`Price             [euros]`)

# Convert 'City Zone' to a factor
data.BRE$`City Zone` <- as.factor(data.BRE$`City Zone`)

# Rebuild the model with the refined variables
model_refined <- lm(lnPrice ~ 
                      `City Zone` + 
                      `m^2` + 
                      Rooms + 
                      Elevator + 
                      Terrasse, 
                    data = data.BRE)

# View the model summary
summary(model_refined)

# Load the prediction data
data.pred <- read_excel(file.choose(), sheet = "200 properties to be priced")

# Check the column names of the prediction data
colnames(data.pred)

# Convert 'City Zone' in the prediction data to a factor with the same levels as the training data
data.pred$`City Zone` <- factor(data.pred$`City Zone`, levels = levels(data.BRE$`City Zone`))

# Handle any new levels (set them as NA or drop them)
data.pred$`City Zone`[is.na(data.pred$`City Zone`)] <- NA

# Predict the log-transformed prices for the 200 properties
data.pred$Predicted_lnPrice <- predict(model_refined, newdata = data.pred)

# Convert the predicted log prices back to actual prices
data.pred$Predicted_Price <- exp(data.pred$Predicted_lnPrice)

# View the results with the predicted prices (update column names as needed)
head(data.pred[, c("Your Price Prediction", "Predicted_Price")])

# Save the predictions to a new Excel file
write.xlsx(data.pred, "PricePredictions_200Properties.xlsx")
