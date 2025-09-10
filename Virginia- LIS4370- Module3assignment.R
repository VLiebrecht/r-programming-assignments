library(ggplot2)

Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

df_polls <- data.frame(Name, ABC_poll, CBS_poll)

str(df_polls)
head(df_polls)

mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)

mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)


df_polls$diff <- df_polls$CBS_poll - df_polls$ABC_poll
head(df_polls)

ggplot(df_polls, aes(Name)) +
  geom_col(aes(y = ABC_poll, fill = "ABC"), width = 0.25, position = position_nudge(x = -0.25)) +
  geom_col(aes(y = CBS_poll, fill = "CBS"), width = 0.25, position = position_nudge(x = 0.00)) +
  geom_col(aes(y= diff, fill = "Diff"), width = 0.25, position = position_nudge(x=0.25)) +
  labs(
    title = "ABC vs CBS Polls and Difference",
    x = "Candidate",
    y = "Poll Value",
    fill = "Measure"
  )
