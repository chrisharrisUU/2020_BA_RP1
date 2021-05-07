# Setup -------------------------------------------------------------------

if (!require(needs)) {install.packages("needs"); library(needs)}
if (!require(goallabr)) {
  if (!require(devtools)) {install.packages("devtools"); library(devtools)}
  install_github("chrisharrisUU/goallabr")
}
needs(BayesFactor, dplyr, ggplot2, ggsci, goallabr,
      gridExtra, haven, Hmisc, here, lme4, lmerTest,
      magrittr, tidyr, papaja, purrr, svglite)
prioritize(dplyr)

# Color palette for graphs
pal <- ggsci::pal_uchicago()(5)[c(3, 5, 1)]

source(here("Auxiliary/functions.R"))

# Data import -------------------------------------------------------------

source(here("Auxiliary/exp1_import.r"))
rm(as.data.frame.avector, `[.avector`)

data1 <- filter(data1, LASTPAGE == 17)

### Rename variables
column.rename <- function(.data) {
  # Prolific id
  id <- .data$IV01_RV1
  
  # Condition
  
  
  # condition (rich vs impoverished)
  # winning option (tools vs weapons)
  # primacy (left vs right)
  # direction of question (tool vs weapon)
  
  # i-weapons-left-tool
  # i-weapons-right-tool
  # i-weapons-left-weapon
  # i-weapons-right-weapon
  
  # Condition
  condition <- transmute(.data, condition = "impoverished")
  
  # Primacy
  primacy <- .data %>%
    transmute(primacy = ifelse(UR01 %in% c(1, 3), -1, 1)) %>%
    mutate(primacy = factor(primacy, levels = c(-1,1), labels = c("left frequent", "right frequent")))
  
  # Winning option
  winning <- transmute(.data, winning = "knife")
  
  # Direction of question
  questdir <- .data %>%
    transmute(questdir = ifelse(UR01 %in% c(3, 4), -1, 1)) %>%
    mutate(questdir = factor(questdir, levels = c(-1,1), labels = c("weapon", "tool")))
  
  # All conditions
  levelnames <- c("i-weapons-left-tool", "i-weapons-right-tool", "i-weapons-left-weapon", "i-weapons-right-weapon")
  counterbalancing <- factor(.data$UR01, levels = 1:4, labels = levelnames[1:4])
  
  # Sampling
  freeselection <- .data %>%
    select(contains("TR02")) %>%
    select(everything(), -contains("a")) %>%
    mutate(across(everything(), ~ifelse(.x == "group1.png", -1, ifelse(.x == "group2.png", 1, NA))))
  # Assign useful column names
  colnames(freeselection) <- paste("trial", 17:100, sep = "")
  # Create selection index
  freeselection <- freeselection %>%
    mutate(choiceindex_raw = rowSums(., na.rm = TRUE))
  
  # Preference
  pref <- .data %>%
    transmute(prepref_raw = DV01_01 - 1,
              postpref_raw = DV02_01 - 1)
  
  # Conditionals
  cond <- .data %>%
    transmute(precond_l_raw = DV03_01 - 1,
              precond_r_raw = DV03_02 - 1,
              postcond_l_raw = DV04_01 - 1,
              postcond_r_raw = DV04_02 - 1)
  
  # Confidence
  conf <- .data %>%
    transmute(preconf_l_raw = DV05_01 - 1,
              preconf_r_raw = DV05_02 - 1,
              postconf_l_raw = DV06_01 - 1,
              postconf_r_raw = DV06_02 - 1)
  
  # Demographics
  age <- .data$DM04 %>% as.character() %>% as.numeric()
  gender <- .data$DM05
  psych <- .data$DM06
  edu <- .data$DM07
  
  # Account
  account <- as.integer(as.character(.data$IV02_02))
  
  # Output as dataframe
  data.frame(id,
             counterbalancing, condition, primacy, winning, questdir,
             freeselection, pref, cond, conf,
             age, gender, psych, edu,
             account)
}
df1_raw <- column.rename(data1)


# Counterbalancing --------------------------------------------------------
df1 <- df1_raw %>%
  # Everything as if asked from weapon's perspective
  mutate(prepref_1 = ifelse(questdir == "weapon", prepref_raw, 100 - prepref_raw),
         postpref_1 = ifelse(questdir == "weapon", postpref_raw, 100 - postpref_raw),
         precond_l_1 = ifelse(questdir == "weapon", precond_l_raw, 100 - precond_l_raw),
         precond_r_1 = ifelse(questdir == "weapon", precond_r_raw, 100 - precond_r_raw),
         postcond_l_1 = ifelse(questdir == "weapon", postcond_l_raw, 100 - postcond_l_raw),
         postcond_r_1 = ifelse(questdir == "weapon", postcond_r_raw, 100 - postcond_r_raw),
         preconf_l_1 = ifelse(questdir == "weapon", preconf_l_raw, 100 - preconf_l_raw),
         preconf_r_1 = ifelse(questdir == "weapon", preconf_r_raw, 100 - preconf_r_raw),
         postconf_l_1 = ifelse(questdir == "weapon", postconf_l_raw, 100 - postconf_l_raw),
         postconf_r_1 = ifelse(questdir == "weapon", postconf_r_raw, 100 - postconf_r_raw)) %>%
  # Collapse primacy
  mutate(prepref_2 = ifelse(primacy == "right frequent", prepref_1, 100 - prepref_1),
         postpref_2 = ifelse(primacy == "right frequent", postpref_1, 100 - postpref_1),
         precond_2 = ifelse(primacy == "left frequent", precond_l_1 - precond_r_1, precond_r_1 - precond_l_1),
         postcond_2 = ifelse(primacy == "left frequent", postcond_l_1 - postcond_r_1, postcond_r_1 - postcond_l_1),
         preconf_2 = ifelse(primacy == "left frequent", preconf_l_1 - preconf_r_1, preconf_r_1 - preconf_l_1),
         postconf_2 = ifelse(primacy == "left frequent", postconf_l_1 - postconf_r_1, postconf_r_1 - postconf_l_1),
         choiceindex_freq = ifelse(primacy == "left frequent", choiceindex_raw * (-1), choiceindex_raw)) %>%
  # Shift from 0 - 100 to -50 to 50 and deltaps to -1, 1
  mutate(prepref_freq = prepref_2 - 50,
         postpref_freq = postpref_2 - 50,
         precond_dp = precond_2 / 100,
         postcond_dp = postcond_2 / 100,
         preconf_dp = preconf_2 / 100,
         postconf_dp = postconf_2 / 100,
         # Sampling as percentage
         choiceindex_per = (choiceindex_freq + 84) / (84 * 2))

# summary(lm(prepref_raw ~ questdir * primacy * 1, data = df1_raw))
# summary(lm(prepref_freq ~ 1, data = df1))
# 
# summary(lm(postpref_raw ~ questdir * primacy * 1, data = df1_raw))
# summary(lm(postpref_freq ~ 1, data = df1))
# 
# summary(lm((precond_l_raw - precond_r_raw) ~ winning * questdir * primacy * 1, data = df1_raw))
# summary(lm(precond_dp ~ 1, data = df1))
# 
# summary(lm((postcond_l_raw - postcond_r_raw) ~ questdir * primacy * 1, data = df1_raw))
# summary(lm(postcond_dp ~ 1, data = df1))
# 
# summary(lm(choiceindex_raw ~ questdir * primacy * 1, data = df1_raw))
# summary(lm(choiceindex_freq ~ 1, data = df1))

# Dummy variable
df1 %<>%
  mutate(bias = ifelse(prepref_freq > 0 & precond_dp > 0, 1, 0)) %>%
  mutate(bias = factor(bias, levels = c(0, 1), labels = c("no bias", "bias")))

# Prolific ----------------------------------------------------------------

# # Create CSV of all accepted IDs
# df1 %>%
#   select(id) %>%
#   distinct(id) %>%
#   write.csv(file = "Output/Prolific/2020_BA_RP1_Prolific_accepted.csv", row.names = FALSE)
# 
# 
# # Parameters
# minearn <- .85
# meanearn <- 1
# maxearn <- 1.15
# 
# # Helper function for adjusting payments
# adjuster <- function(x) {
#   if (dplyr::is_grouped_df(x)) {
#     return(dplyr::do(x, adjuster(., ...)))
#   }
# 
#   while (mean(x) < (meanearn - .02)) {
#     maximum <- max(x[x < maxearn])
#     x[which(x == maximum)] <- maxearn
#   }
#   while (mean(x) > (meanearn + 2)) {
#     maximum <- which(x > meanearn)
#     x[maximum] <- x[maximum] - 0.01
#   }
#   x
# }
# 
# # Create CSV file of extra payments
# df1 %>%
#   group_by(condition) %>%
#   mutate(transformed_account = ((account - min(account)) / (max(account) - min(account))) * (maxearn - minearn) + minearn) %>%
#   mutate(transformed_account = adjuster(transformed_account)) %>%
#   mutate(extra_earnings = round(transformed_account, 2) - minearn) %>%
#   ungroup() %>%
#   # summarize(min = min(extra_earnings) + .85,
#   #           mean = mean(extra_earnings) + .85,
#   #           max = max(extra_earnings) + .85,
#   #           total = sum(extra_earnings))
#   select(id, extra_earnings) %>%
#   filter(extra_earnings > 0) %>%
#   write.csv(file = "Output/Prolific/2020_BA_RP1_Prolific_earnings.csv", row.names = FALSE)


# Data export for students ------------------------------------------------
# df1 %>%
#   select(id, counterbalancing, condition, primacy, winning, questdir,
#          contains("trial"), choiceindex_per,
#          prepref_freq, postpref_freq, precond_dp, postcond_dp, preconf_dp, postconf_dp,
#          age, gender, psych, edu) %>%
#   # Counterbalance
#   mutate_at(vars(contains("trial")),
#             ~ifelse(primacy == "left frequent", .x * (-1), .x)) %>%
#   write_sav(., path = "Output/data.sav")

# Demographic data --------------------------------------------------------

# Summary of most relevant demographic data
df1 %>%
  summarise(N = n(),
            female = length(which(gender == "female")),
            age_mean = mean(age, na.rm = TRUE),
            age_sd = sd(age, na.rm = TRUE),
            Psychstudents_percent = length(which(psych == "Yes")) / n() * 100)

# Level of education
df1 %>%
  group_by(edu) %>%
  summarise(count = length(edu))

# Percentage degree
length(which(as.integer(df1$edu) > 2)) / nrow(df1)

# Preference premeasure ----------------------------------------------------------------
# From which of the two groups were you more likely to draw knife/ruler?
# Graph
df1 %>%
  ggplot(aes(x = condition,
             y = prepref_freq,
             fill = condition)) +
  geom_violin() + 
  stat_summary(fun.data = "mean_sdl", geom = "crossbar", width = 0.2, fun.args = list(mult = 1)) +
  geom_jitter(size = 0.5, width = 0.2) +
  geom_hline(yintercept = 0, linetype = 2) +
  scale_fill_manual(values = pal) +
  theme_apa() +
  labs(x = "Condition",
       y = "Relative contingency estimates - pre-measure") +
  theme(legend.position = "none")

# Means and sds
df1 %>%
  summarise(pre_avg = printnum(mean(prepref_freq)),
            pre_SD = printnum(sd(prepref_freq)))

### Analyses

df1 %$%
  ttestBF(prepref_freq,
          mu = 0,
          nullInterval = c(0, Inf)) %>%
  printBFt()
df1 %>%
  ttest(data = .,
        y = prepref_freq,
        x = condition,
        mu = 0,
        dir = "greater")


# Conditionals pre measure -------------------------------------------------
# How likely was it (in %) that you drew knife/ruler if...
# Graph
df1 %>%
  ggplot(aes(x = condition,
             y = precond_dp,
             fill = condition)) +
  geom_violin() + 
  stat_summary(fun.data = "mean_sdl", geom = "crossbar", width = 0.2, fun.args = list(mult = 1)) +
  geom_jitter(size = 0.5, width = 0.2) +
  geom_hline(yintercept = 0, linetype = 2) +
  scale_fill_manual(values = pal) +
  theme_apa() +
  labs(x = "Conditional probability estimates",
       y = expression(Delta*"p")) +
  theme(legend.position = "none")

# Summary statistics and tests
df1 %>%
  mutate(frequent = ifelse(primacy == "left frequent", preconf_l_raw, preconf_r_raw),
         infrequent = ifelse(primacy == "left frequent", preconf_r_raw, preconf_l_raw)) %>%
  summarize(pre_winning_rich = printnum(mean(frequent)),
            pre_losing_rich = printnum(mean(infrequent)),
            winning_bag_sd = printnum(sd(frequent)),
            losing_bag_sd = printnum(sd(infrequent)))

df1 %>%
  summarize(pre_avg = printnum(mean(precond_dp)),
            pre_SD = printnum(sd(precond_dp)))

### Analyses

# Normative
ttestBF(df1$precond_dp, mu = 0, nullInterval = c(0, Inf)) %>% printBFt()
ttest(data = df1,
      y = precond_dp,
      x = condition,
      mu = 0,
      dir = "greater")

# Confidence pre measure -------------------------------------------------
# Means and sds
df1 %>%
  summarise(pre_avg = printnum(mean(preconf_dp)),
            pre_SD = printnum(sd(preconf_dp)))

preconf <- df1 %>%
  mutate(conf_pre_fr = ifelse(primacy == "left frequent", preconf_l_raw, preconf_r_raw),
         conf_pre_in = ifelse(primacy == "left frequent", preconf_r_raw, preconf_l_raw)) %>%
  select(id, bias, conf_pre_fr, conf_pre_in) %>%
  pivot_longer(cols = c(conf_pre_fr, conf_pre_in),
               names_to = "type",
               values_to = "confidence")
preconf %>%
  group_by(bias, type) %>%
  summarize(avg = printnum(mean(confidence)),
            sd = printnum(sd(confidence)))

# Inference tests
df1 %>%
  as.data.frame() %$%
  ttestBF(preconf_dp,
          mu = 0,
          nullInterval = c(-Inf, Inf),
          data = .) %>%
  printBFt()
ttest(data = df1, y = preconf_dp, x = condition, mu = 0)

# Sampling -------------------------------------------------
# Graph over trials
time_series(df1, condition)
time_series(df1, bias)
ggsave(filename = "Output/Graphs/sampling1.svg", device = "svg", dpi = 320, width = 9.08, height = 5.72)
# ggsave("Output/sampling.png", device = "png" , dpi = 320, width = 9.08, height = 5.72)

# First trial
df1 %>%
  # Counterbalance
  mutate_at(vars(contains("trial")),
            ~ifelse(primacy == "left frequent", .x * (-1), .x)) %>%
  select(id, bias, contains("trial")) %>%
  # Trial 18
  mutate(trial17 = ifelse(trial17 == 1, 1, 0)) %>%
  group_by(bias) %>%
  summarize(test = mean(trial17, na.rm = T))

# Means and sds
df1 %>%
  group_by(bias) %>%
  summarise(M = printnum(100 * mean(choiceindex_per)),
            SD = printnum(100 * sd(choiceindex_per)))

### Analyses
# asd

# Mixed-effects model
df1 %>%
  # Counterbalance
  mutate_at(vars(contains("trial")),
            ~ifelse(primacy == "left frequent", .x * (-1), .x)) %>%
  select(id, bias, contains("trial")) %>%
  # Long format
  pivot_longer(cols = -c(id, bias),
               names_to = "trial",
               values_to = "choice") %>%
  # Correct variables
  mutate(trial = substr(trial, 6, nchar(trial)),
         choice = ifelse(choice == 1, 1, 0)) %>%
  mutate(trial = as.double(trial),
         trials = as.double(trial - 16) / 100) %>%
  # Mixed-effects models
  glmer(choice ~ (I(trials^2) + trials) * bias + (1|id), family = binomial, data = .) %>%
  summary()

# Preference post measure ----------------------------------------------------------------
# Graph
df1 %>%
  ggplot(aes(x = condition,
             y = postpref_freq,
             fill = condition)) +
  geom_violin() + 
  stat_summary(fun.data = "mean_sdl", geom = "crossbar", width = 0.2, fun.args = list(mult = 1)) +
  geom_jitter(size = 0.5, width = 0.2) +
  geom_hline(yintercept = 0, linetype = 2) +
  scale_fill_manual(values = pal) +
  theme_apa() +
  labs(x = "Condition",
       y = "Relative contingency estimates - post-measure") +
  theme(legend.position = "none")

# Means and sds
df1 %>%
  group_by(bias) %>%
  summarise(post_avg = printnum(mean(postpref_freq)),
            post_SD = printnum(sd(postpref_freq)))

### Analyses
# asd

# Graph
df1 %>%
  gather(key = time,
         value = polarity,
         c(prepref_freq, postpref_freq)) %>%
  mutate(time = factor(time,
                       levels = c("prepref_freq", "postpref_freq"),
                       labels = c("pre", "post"))) %>%
  within_ci(data = .,
            subject = id,
            value = polarity,
            ws_factors = time,
            bs_factors = bias) %>%
  ggplot(aes(color = bias)) +
  geom_point(aes(x = time,
                 y = sample_mean)) +
  geom_line(aes(x = time,
                y = sample_mean,
                group = bias),
            size = .9) +
  geom_errorbar(width = .1,
                aes(x = time,
                    ymin = sample_mean - CI,
                    ymax = sample_mean + CI)) +
  scale_color_manual(values = pal) +
  theme_apa() +
  labs(x = "Measurement point",
       y = "Relative contingency estimates")

# Conditionals post measure -------------------------------------------------
# Graph
df1 %>%
  ggplot(aes(x = condition,
             y = postcond_dp,
             fill = condition)) +
  geom_violin() + 
  stat_summary(fun.data = "mean_sdl", geom = "crossbar", width = 0.2, fun.args = list(mult = 1)) +
  geom_jitter(size = 0.5, width = 0.2) +
  geom_hline(yintercept = 0, linetype = 2) +
  scale_fill_manual(values = pal) +
  theme_apa() +
  labs(x = "Conditional probability estimates",
       y = expression(Delta*"p")) +
  theme(legend.position = "none")

# Summary statistics and tests
df1 %>%
  mutate(frequent = ifelse(primacy == "left frequent", postcond_l_1, postcond_r_1),
         infrequent = ifelse(primacy == "left frequent", postcond_r_1, postcond_l_1)) %>%
  group_by(bias) %>%
  summarise(winning_bag = printnum(mean(frequent)),
            losing_bag = printnum(mean(infrequent)),
            winning_bag_sd = printnum(sd(frequent)),
            losing_bag_sd = printnum(sd(infrequent)))

df1 %>%
  group_by(bias) %>%
  summarise(post_avg = printnum(mean(postcond_dp)),
            post_SD = printnum(sd(postcond_dp)))

### Analyses
# asd

# Graph
df1 %>%
  gather(key = time,
         value = conditionals,
         c(precond_dp, postcond_dp)) %>%
  mutate(time = factor(time,
                       levels = c("precond_dp", "postcond_dp"),
                       labels = c("Pre", "Post"))) %>%
  within_ci(data = .,
            subject = id,
            value = conditionals,
            ws_factors = time,
            bs_factors = bias) %>%
  ggplot(aes(color = bias)) +
  geom_point(aes(x = time,
                 y = sample_mean)) +
  geom_line(aes(x = time,
                y = sample_mean,
                group = bias),
            size = .9) +
  geom_errorbar(width = .1,
                aes(x = time,
                    ymin = sample_mean - CI,
                    ymax = sample_mean + CI)) +
  scale_color_manual(values = pal) +
  theme_apa() +
  labs(x = "Measurement point",
       y = expression(Delta*"p"))

# Confidence post measure -------------------------------------------------
# Means and sds
df1 %>%
  group_by(bias) %>%
  summarise(post_avg = printnum(mean(postconf_dp)),
            post_SD = printnum(sd(postconf_dp)))

postconf <- df1 %>%
  group_by(condition) %>%
  mutate(conf_post_fr = ifelse(primacy == "left frequent", postconf_l_raw, postconf_r_raw),
         conf_post_in = ifelse(primacy == "left frequent", postconf_r_raw, postconf_l_raw)) %>%
  ungroup %>%
  select(condition, bias, conf_post_fr, conf_post_in) %>%
  pivot_longer(cols = c(conf_post_fr, conf_post_in),
               names_to = "type",
               values_to = "confidence")
postconf %>%
  group_by(bias, type) %>%
  summarize(avg = printnum(mean(confidence)),
            sd = printnum(sd(confidence)))

# Inference tests
# Bias
df1 %>%
  filter(bias == "bias") %>%
  as.data.frame() %$%
  ttestBF(postconf_dp,
          mu = 0,
          nullInterval = c(-Inf, Inf)) %>%
  printBFt()
ttest(data = df1, y = postconf_dp, x = bias, sub = "bias", mu = 0)

# No bias
df1 %>%
  filter(bias == "no bias") %>%
  as.data.frame() %$%
  ttestBF(postconf_dp,
          mu = 0,
          nullInterval = c(-Inf, Inf)) %>%
  printBFt()
ttest(data = df1, y = postconf_dp, x = bias, sub = "no bias", mu = 0)

