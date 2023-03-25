library(ggplot2)
library(tidyr)
library(dplyr)

dat <- read.csv("obs_for class.csv")

# df = data.frame(subject <- c('ADA','ADA','ADA','CN','CN','CN','PDS','PDS','PDS','CPDP',
#                              'CPDP','CPDP'),
#                 credit <- c('Midsem','Viva','Attendance','Midsem','Viva','Attendance',
#                             'Midsem','Viva','Attendance','Midsem','Viva','Attendance'),
#                 value <- c(50,30,20,40,40,20,50,35,15,50,40,10))

dat$Session.ID <- factor(dat$Session.ID)
dat$Common.Name <- factor(dat$Common.Name)

dat2 <- dat %>% group_by(Session.ID, Common.Name) %>% summarise(Value = n())
dat2 <- dat2[-c(1), ]
dat2$Cam <- c("1 (n=16)","1 (n=16)","12 (n=7)","2 (n=13)","2 (n=13)","2 (n=13)","3 (n=17)",
              "3 (n=17)","4 (n=33)","4 (n=33)","4 (n=33)","4 (n=33)","5 (n=32)","5 (n=32)","8 (n=1)")

dat2$Cam <- factor(dat2$Cam)

p <- ggplot(data = dat2, aes(x=" ", y = Value, group = Common.Name, colour = Common.Name, fill=Common.Name)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) +
  facet_grid(.~ Cam) +theme_void()
