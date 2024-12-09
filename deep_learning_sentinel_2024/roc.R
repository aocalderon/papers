library(ggplot2)

# Approximated data points for the ROC curve
roc_data <- data.frame(
  False_Positive_Rate = c(0.0, 0.001, 0.002, 0.003, 0.005, 0.007, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.1, 
                          0.12, 0.14, 0.16, 0.18, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0),
  True_Positive_Rate = c(0.0, 0.85, 0.88, 0.9, 0.92, 0.94, 0.95, 0.97, 0.98, 0.985, 0.988, 0.99, 0.992, 0.994, 0.995,
                         0.996, 0.997, 0.998, 0.9985, 0.999, 0.9993, 0.9995, 0.9997, 0.9998, 0.9999, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0)
)

# Plotting the ROC curve
ggplot(roc_data, aes(x = False_Positive_Rate, y = True_Positive_Rate)) +
  geom_line(aes(color = "ROC Curve (AUC = 1.00)")) + # Add a legend entry for the orange line
  geom_line(color = "orange") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "blue") +
  labs(
    #title = "Receiver Operating Characteristic (ROC) Curve",
    x = "False Positive Rate",
    y = "True Positive Rate",
    color = NULL # Remove color legend title
  ) +
  theme_bw() +
  theme(legend.position = c(0.70, 0.075)) 

W = 4
H = 4

ggsave(paste0("roc.pdf"), width = W, height = H)