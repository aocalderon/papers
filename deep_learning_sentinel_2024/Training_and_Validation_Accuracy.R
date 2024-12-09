library(tidyverse)

W = 4
H = 3

training <- read_csv("training.csv", col_names = TRUE) |>
  mutate(Epoch = round(Epoch, digits = 0)) |>
  group_by(Epoch) |> summarise(Training = mean(Training))
validation <- read_csv("validation.csv", col_names = TRUE) |>
  mutate(Epoch = round(Epoch, digits = 0)) |>
  group_by(Epoch) |> summarise(Validation = mean(Validation))

data <- training |> inner_join(validation, join_by(Epoch)) |>
  pivot_longer(cols = c(Training, Validation), 
               names_to = "Type", 
               values_to = "Accuracy")

p = ggplot(data, aes(x = Epoch, y = Accuracy, color = Type)) +
  geom_line() +
  geom_point() +
  labs(
    x = "Epoch",
    y = "Accuracy",
    color = "Legend"
  ) +
  theme_bw() + 
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "bottom"
  )
plot(p)

ggsave(paste0("accuracy.pdf"), width = W, height = H)