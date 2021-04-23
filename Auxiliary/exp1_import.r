# This script reads a CSV file in GNU R.
# While reading this file, comments will be created for all variables.
# The comments for values will be stored as attributes (attr) as well.

# data1_file = file.choose()
# setwd("./")
data1_file = here("Data/exp1_data.csv")

data1 = read.table(
  file=data1_file, encoding="UTF-8",
  header = FALSE, sep = "\t", quote = "\"",
  dec = ".", row.names = "CASE",
  col.names = c(
    "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","UR01_CP","UR01","UR02_CP",
    "UR02x01","UR02x02","UR02x03","UR02x04","UR02x05","UR02x06","UR02x07","UR02x08",
    "UR02x09","UR02x10","UR02x11","UR02x12","UR02x13","UR02x14","UR02x15","UR02x16",
    "UR02x17","UR02x18","UR02x19","UR02x20","UR02x21","UR02x22","UR02x23","UR02x24",
    "UR02x25","UR02x26","UR02x27","UR02x28","UR02x29","UR02x30","UR02x31","UR02x32",
    "UR02x33","UR02x34","UR02x35","UR02x36","UR02x37","UR02x38","UR02x39","UR02x40",
    "UR02x41","UR02x42","UR02x43","UR02x44","UR02x45","UR02x46","UR02x47","UR02x48",
    "UR02x49","UR02x50","UR02x51","UR02x52","UR02x53","UR02x54","UR02x55","UR02x56",
    "UR02x57","UR02x58","UR02x59","UR02x60","UR02x61","UR02x62","UR02x63","UR02x64",
    "UR02x65","UR02x66","UR02x67","UR02x68","UR02x69","UR02x70","UR02x71","UR02x72",
    "UR02x73","UR02x74","UR02x75","UR02x76","UR02x77","UR02x78","UR02x79","UR02x80",
    "UR02x81","UR02x82","UR02x83","UR02x84","TR01_01","TR01_01a","TR01_02",
    "TR01_02a","TR01_03","TR01_03a","TR01_04","TR01_04a","TR01_05","TR01_05a",
    "TR01_06","TR01_06a","TR01_07","TR01_07a","TR01_08","TR01_08a","TR01_09",
    "TR01_09a","TR01_10","TR01_10a","TR01_11","TR01_11a","TR01_12","TR01_12a",
    "TR01_13","TR01_13a","TR01_14","TR01_14a","TR01_15","TR01_15a","TR01_16",
    "TR01_16a","TR02_01","TR02_01a","TR02_02","TR02_02a","TR02_03","TR02_03a",
    "TR02_04","TR02_04a","TR02_05","TR02_05a","TR02_06","TR02_06a","TR02_07",
    "TR02_07a","TR02_08","TR02_08a","TR02_09","TR02_09a","TR02_10","TR02_10a",
    "TR02_11","TR02_11a","TR02_12","TR02_12a","TR02_13","TR02_13a","TR02_14",
    "TR02_14a","TR02_15","TR02_15a","TR02_16","TR02_16a","TR02_17","TR02_17a",
    "TR02_18","TR02_18a","TR02_19","TR02_19a","TR02_20","TR02_20a","TR02_21",
    "TR02_21a","TR02_22","TR02_22a","TR02_23","TR02_23a","TR02_24","TR02_24a",
    "TR02_25","TR02_25a","TR02_26","TR02_26a","TR02_27","TR02_27a","TR02_28",
    "TR02_28a","TR02_29","TR02_29a","TR02_30","TR02_30a","TR02_31","TR02_31a",
    "TR02_32","TR02_32a","TR02_33","TR02_33a","TR02_34","TR02_34a","TR02_35",
    "TR02_35a","TR02_36","TR02_36a","TR02_37","TR02_37a","TR02_38","TR02_38a",
    "TR02_39","TR02_39a","TR02_40","TR02_40a","TR02_41","TR02_41a","TR02_42",
    "TR02_42a","TR02_43","TR02_43a","TR02_44","TR02_44a","TR02_45","TR02_45a",
    "TR02_46","TR02_46a","TR02_47","TR02_47a","TR02_48","TR02_48a","TR02_49",
    "TR02_49a","TR02_50","TR02_50a","TR02_51","TR02_51a","TR02_52","TR02_52a",
    "TR02_53","TR02_53a","TR02_54","TR02_54a","TR02_55","TR02_55a","TR02_56",
    "TR02_56a","TR02_57","TR02_57a","TR02_58","TR02_58a","TR02_59","TR02_59a",
    "TR02_60","TR02_60a","TR02_61","TR02_61a","TR02_62","TR02_62a","TR02_63",
    "TR02_63a","TR02_64","TR02_64a","TR02_65","TR02_65a","TR02_66","TR02_66a",
    "TR02_67","TR02_67a","TR02_68","TR02_68a","TR02_69","TR02_69a","TR02_70",
    "TR02_70a","TR02_71","TR02_71a","TR02_72","TR02_72a","TR02_73","TR02_73a",
    "TR02_74","TR02_74a","TR02_75","TR02_75a","TR02_76","TR02_76a","TR02_77",
    "TR02_77a","TR02_78","TR02_78a","TR02_79","TR02_79a","TR02_80","TR02_80a",
    "TR02_81","TR02_81a","TR02_82","TR02_82a","TR02_83","TR02_83a","TR02_84",
    "TR02_84a","IV01_RV1","IV01_REF","IV02_01","IV02_02","DM03","DM04","DM05",
    "DM06","DM07","DM10_01","DM11","DM11_01","DV01_01","DV02_01","DV03_01",
    "DV03_02","DV04_01","DV04_02","DV05_01","DV05_02","DV06_01","DV06_02","TIME001",
    "TIME002","TIME003","TIME004","TIME005","TIME006","TIME007","TIME008","TIME009",
    "TIME010","TIME011","TIME012","TIME013","TIME014","TIME015","TIME016","TIME017",
    "TIME_SUM","MAILSENT","LASTDATA","FINISHED","Q_VIEWER","LASTPAGE","MAXPAGE",
    "MISSING","MISSREL","TIME_RSI","DEG_TIME"
  ),
  as.is = TRUE,
  colClasses = c(
    CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
    MODE="character", STARTED="POSIXct", UR01_CP="numeric", UR01="numeric",
    UR02_CP="numeric", UR02x01="numeric", UR02x02="numeric", UR02x03="numeric",
    UR02x04="numeric", UR02x05="numeric", UR02x06="numeric", UR02x07="numeric",
    UR02x08="numeric", UR02x09="numeric", UR02x10="numeric", UR02x11="numeric",
    UR02x12="numeric", UR02x13="numeric", UR02x14="numeric", UR02x15="numeric",
    UR02x16="numeric", UR02x17="numeric", UR02x18="numeric", UR02x19="numeric",
    UR02x20="numeric", UR02x21="numeric", UR02x22="numeric", UR02x23="numeric",
    UR02x24="numeric", UR02x25="numeric", UR02x26="numeric", UR02x27="numeric",
    UR02x28="numeric", UR02x29="numeric", UR02x30="numeric", UR02x31="numeric",
    UR02x32="numeric", UR02x33="numeric", UR02x34="numeric", UR02x35="numeric",
    UR02x36="numeric", UR02x37="numeric", UR02x38="numeric", UR02x39="numeric",
    UR02x40="numeric", UR02x41="numeric", UR02x42="numeric", UR02x43="numeric",
    UR02x44="numeric", UR02x45="numeric", UR02x46="numeric", UR02x47="numeric",
    UR02x48="numeric", UR02x49="numeric", UR02x50="numeric", UR02x51="numeric",
    UR02x52="numeric", UR02x53="numeric", UR02x54="numeric", UR02x55="numeric",
    UR02x56="numeric", UR02x57="numeric", UR02x58="numeric", UR02x59="numeric",
    UR02x60="numeric", UR02x61="numeric", UR02x62="numeric", UR02x63="numeric",
    UR02x64="numeric", UR02x65="numeric", UR02x66="numeric", UR02x67="numeric",
    UR02x68="numeric", UR02x69="numeric", UR02x70="numeric", UR02x71="numeric",
    UR02x72="numeric", UR02x73="numeric", UR02x74="numeric", UR02x75="numeric",
    UR02x76="numeric", UR02x77="numeric", UR02x78="numeric", UR02x79="numeric",
    UR02x80="numeric", UR02x81="numeric", UR02x82="numeric", UR02x83="numeric",
    UR02x84="numeric", TR01_01="numeric", TR01_01a="numeric", TR01_02="numeric",
    TR01_02a="numeric", TR01_03="numeric", TR01_03a="numeric",
    TR01_04="numeric", TR01_04a="numeric", TR01_05="numeric",
    TR01_05a="numeric", TR01_06="numeric", TR01_06a="numeric",
    TR01_07="numeric", TR01_07a="numeric", TR01_08="numeric",
    TR01_08a="numeric", TR01_09="numeric", TR01_09a="numeric",
    TR01_10="numeric", TR01_10a="numeric", TR01_11="numeric",
    TR01_11a="numeric", TR01_12="numeric", TR01_12a="numeric",
    TR01_13="numeric", TR01_13a="numeric", TR01_14="numeric",
    TR01_14a="numeric", TR01_15="numeric", TR01_15a="numeric",
    TR01_16="numeric", TR01_16a="numeric", TR02_01="numeric",
    TR02_01a="numeric", TR02_02="numeric", TR02_02a="numeric",
    TR02_03="numeric", TR02_03a="numeric", TR02_04="numeric",
    TR02_04a="numeric", TR02_05="numeric", TR02_05a="numeric",
    TR02_06="numeric", TR02_06a="numeric", TR02_07="numeric",
    TR02_07a="numeric", TR02_08="numeric", TR02_08a="numeric",
    TR02_09="numeric", TR02_09a="numeric", TR02_10="numeric",
    TR02_10a="numeric", TR02_11="numeric", TR02_11a="numeric",
    TR02_12="numeric", TR02_12a="numeric", TR02_13="numeric",
    TR02_13a="numeric", TR02_14="numeric", TR02_14a="numeric",
    TR02_15="numeric", TR02_15a="numeric", TR02_16="numeric",
    TR02_16a="numeric", TR02_17="numeric", TR02_17a="numeric",
    TR02_18="numeric", TR02_18a="numeric", TR02_19="numeric",
    TR02_19a="numeric", TR02_20="numeric", TR02_20a="numeric",
    TR02_21="numeric", TR02_21a="numeric", TR02_22="numeric",
    TR02_22a="numeric", TR02_23="numeric", TR02_23a="numeric",
    TR02_24="numeric", TR02_24a="numeric", TR02_25="numeric",
    TR02_25a="numeric", TR02_26="numeric", TR02_26a="numeric",
    TR02_27="numeric", TR02_27a="numeric", TR02_28="numeric",
    TR02_28a="numeric", TR02_29="numeric", TR02_29a="numeric",
    TR02_30="numeric", TR02_30a="numeric", TR02_31="numeric",
    TR02_31a="numeric", TR02_32="numeric", TR02_32a="numeric",
    TR02_33="numeric", TR02_33a="numeric", TR02_34="numeric",
    TR02_34a="numeric", TR02_35="numeric", TR02_35a="numeric",
    TR02_36="numeric", TR02_36a="numeric", TR02_37="numeric",
    TR02_37a="numeric", TR02_38="numeric", TR02_38a="numeric",
    TR02_39="numeric", TR02_39a="numeric", TR02_40="numeric",
    TR02_40a="numeric", TR02_41="numeric", TR02_41a="numeric",
    TR02_42="numeric", TR02_42a="numeric", TR02_43="numeric",
    TR02_43a="numeric", TR02_44="numeric", TR02_44a="numeric",
    TR02_45="numeric", TR02_45a="numeric", TR02_46="numeric",
    TR02_46a="numeric", TR02_47="numeric", TR02_47a="numeric",
    TR02_48="numeric", TR02_48a="numeric", TR02_49="numeric",
    TR02_49a="numeric", TR02_50="numeric", TR02_50a="numeric",
    TR02_51="numeric", TR02_51a="numeric", TR02_52="numeric",
    TR02_52a="numeric", TR02_53="numeric", TR02_53a="numeric",
    TR02_54="numeric", TR02_54a="numeric", TR02_55="numeric",
    TR02_55a="numeric", TR02_56="numeric", TR02_56a="numeric",
    TR02_57="numeric", TR02_57a="numeric", TR02_58="numeric",
    TR02_58a="numeric", TR02_59="numeric", TR02_59a="numeric",
    TR02_60="numeric", TR02_60a="numeric", TR02_61="numeric",
    TR02_61a="numeric", TR02_62="numeric", TR02_62a="numeric",
    TR02_63="numeric", TR02_63a="numeric", TR02_64="numeric",
    TR02_64a="numeric", TR02_65="numeric", TR02_65a="numeric",
    TR02_66="numeric", TR02_66a="numeric", TR02_67="numeric",
    TR02_67a="numeric", TR02_68="numeric", TR02_68a="numeric",
    TR02_69="numeric", TR02_69a="numeric", TR02_70="numeric",
    TR02_70a="numeric", TR02_71="numeric", TR02_71a="numeric",
    TR02_72="numeric", TR02_72a="numeric", TR02_73="numeric",
    TR02_73a="numeric", TR02_74="numeric", TR02_74a="numeric",
    TR02_75="numeric", TR02_75a="numeric", TR02_76="numeric",
    TR02_76a="numeric", TR02_77="numeric", TR02_77a="numeric",
    TR02_78="numeric", TR02_78a="numeric", TR02_79="numeric",
    TR02_79a="numeric", TR02_80="numeric", TR02_80a="numeric",
    TR02_81="numeric", TR02_81a="numeric", TR02_82="numeric",
    TR02_82a="numeric", TR02_83="numeric", TR02_83a="numeric",
    TR02_84="numeric", TR02_84a="numeric", IV01_RV1="character",
    IV01_REF="character", IV02_01="character", IV02_02="character",
    DM03="numeric", DM04="numeric", DM05="numeric", DM06="numeric",
    DM07="numeric", DM10_01="character", DM11="numeric", DM11_01="logical",
    DV01_01="numeric", DV02_01="numeric", DV03_01="numeric", DV03_02="numeric",
    DV04_01="numeric", DV04_02="numeric", DV05_01="numeric", DV05_02="numeric",
    DV06_01="numeric", DV06_02="numeric", TIME001="integer", TIME002="integer",
    TIME003="integer", TIME004="integer", TIME005="integer", TIME006="integer",
    TIME007="integer", TIME008="integer", TIME009="integer", TIME010="integer",
    TIME011="integer", TIME012="integer", TIME013="integer", TIME014="integer",
    TIME015="integer", TIME016="integer", TIME017="integer", TIME_SUM="integer",
    MAILSENT="POSIXct", LASTDATA="POSIXct", FINISHED="logical",
    Q_VIEWER="logical", LASTPAGE="numeric", MAXPAGE="numeric",
    MISSING="numeric", MISSREL="numeric", TIME_RSI="numeric", DEG_TIME="numeric"
  ),
  skip = 1,
  check.names = TRUE, fill = TRUE,
  strip.white = FALSE, blank.lines.skip = TRUE,
  comment.char = "",
  na.strings = ""
)

rm(data1_file)

attr(data1, "project") = "ba21rp"
attr(data1, "description") = "BA21-rp"
attr(data1, "date") = "2021-04-23 14:48:50"
attr(data1, "server") = "https://www.soscisurvey.de"

# Variable und Value Labels
data1$TR01_01 = factor(data1$TR01_01, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_02 = factor(data1$TR01_02, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_03 = factor(data1$TR01_03, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_04 = factor(data1$TR01_04, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_05 = factor(data1$TR01_05, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_06 = factor(data1$TR01_06, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_07 = factor(data1$TR01_07, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_08 = factor(data1$TR01_08, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_09 = factor(data1$TR01_09, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_10 = factor(data1$TR01_10, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_11 = factor(data1$TR01_11, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_12 = factor(data1$TR01_12, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_13 = factor(data1$TR01_13, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_14 = factor(data1$TR01_14, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_15 = factor(data1$TR01_15, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR01_16 = factor(data1$TR01_16, levels=c("1"), labels=c("%forced%"), ordered=FALSE)
data1$TR02_01 = factor(data1$TR02_01, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_02 = factor(data1$TR02_02, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_03 = factor(data1$TR02_03, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_04 = factor(data1$TR02_04, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_05 = factor(data1$TR02_05, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_06 = factor(data1$TR02_06, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_07 = factor(data1$TR02_07, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_08 = factor(data1$TR02_08, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_09 = factor(data1$TR02_09, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_10 = factor(data1$TR02_10, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_11 = factor(data1$TR02_11, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_12 = factor(data1$TR02_12, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_13 = factor(data1$TR02_13, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_14 = factor(data1$TR02_14, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_15 = factor(data1$TR02_15, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_16 = factor(data1$TR02_16, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_17 = factor(data1$TR02_17, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_18 = factor(data1$TR02_18, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_19 = factor(data1$TR02_19, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_20 = factor(data1$TR02_20, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_21 = factor(data1$TR02_21, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_22 = factor(data1$TR02_22, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_23 = factor(data1$TR02_23, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_24 = factor(data1$TR02_24, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_25 = factor(data1$TR02_25, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_26 = factor(data1$TR02_26, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_27 = factor(data1$TR02_27, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_28 = factor(data1$TR02_28, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_29 = factor(data1$TR02_29, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_30 = factor(data1$TR02_30, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_31 = factor(data1$TR02_31, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_32 = factor(data1$TR02_32, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_33 = factor(data1$TR02_33, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_34 = factor(data1$TR02_34, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_35 = factor(data1$TR02_35, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_36 = factor(data1$TR02_36, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_37 = factor(data1$TR02_37, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_38 = factor(data1$TR02_38, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_39 = factor(data1$TR02_39, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_40 = factor(data1$TR02_40, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_41 = factor(data1$TR02_41, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_42 = factor(data1$TR02_42, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_43 = factor(data1$TR02_43, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_44 = factor(data1$TR02_44, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_45 = factor(data1$TR02_45, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_46 = factor(data1$TR02_46, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_47 = factor(data1$TR02_47, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_48 = factor(data1$TR02_48, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_49 = factor(data1$TR02_49, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_50 = factor(data1$TR02_50, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_51 = factor(data1$TR02_51, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_52 = factor(data1$TR02_52, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_53 = factor(data1$TR02_53, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_54 = factor(data1$TR02_54, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_55 = factor(data1$TR02_55, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_56 = factor(data1$TR02_56, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_57 = factor(data1$TR02_57, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_58 = factor(data1$TR02_58, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_59 = factor(data1$TR02_59, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_60 = factor(data1$TR02_60, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_61 = factor(data1$TR02_61, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_62 = factor(data1$TR02_62, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_63 = factor(data1$TR02_63, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_64 = factor(data1$TR02_64, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_65 = factor(data1$TR02_65, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_66 = factor(data1$TR02_66, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_67 = factor(data1$TR02_67, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_68 = factor(data1$TR02_68, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_69 = factor(data1$TR02_69, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_70 = factor(data1$TR02_70, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_71 = factor(data1$TR02_71, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_72 = factor(data1$TR02_72, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_73 = factor(data1$TR02_73, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_74 = factor(data1$TR02_74, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_75 = factor(data1$TR02_75, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_76 = factor(data1$TR02_76, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_77 = factor(data1$TR02_77, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_78 = factor(data1$TR02_78, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_79 = factor(data1$TR02_79, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_80 = factor(data1$TR02_80, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_81 = factor(data1$TR02_81, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_82 = factor(data1$TR02_82, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_83 = factor(data1$TR02_83, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$TR02_84 = factor(data1$TR02_84, levels=c("1","2"), labels=c("group1.png","group2.png"), ordered=FALSE)
data1$DM03 = factor(data1$DM03, levels=c("1","2","-9"), labels=c("I agree","I disagree","[NA] Not answered"), ordered=FALSE)
data1$DM04 = factor(data1$DM04, levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","-9"), labels=c("18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","[NA] Not answered"), ordered=FALSE)
data1$DM05 = factor(data1$DM05, levels=c("1","2","3","-9"), labels=c("male","female","other","[NA] Not answered"), ordered=FALSE)
data1$DM06 = factor(data1$DM06, levels=c("1","2","-9"), labels=c("Yes","No","[NA] Not answered"), ordered=FALSE)
data1$DM07 = factor(data1$DM07, levels=c("1","2","3","4","5","6","-9"), labels=c("No formal education","Secondary school/GCSE","College/A levels","Undergraduate degree (BA, BSc or comparable)","Graduate degree (MA, MSc or comparable)","Doctorate degree (PhD, MD, or comparable)","[NA] Not answered"), ordered=FALSE)
attr(data1$UR01,"1") = "i-weapons-left-tool"
attr(data1$UR01,"2") = "i-weapons-right-tool"
attr(data1$UR01,"3") = "i-weapons-left-weapon"
attr(data1$UR01,"4") = "i-weapons-right-weapon"
attr(data1$UR02x01,"1") = "1"
attr(data1$UR02x01,"2") = "2"
attr(data1$UR02x01,"3") = "3"
attr(data1$UR02x01,"4") = "4"
attr(data1$UR02x02,"1") = "1"
attr(data1$UR02x02,"2") = "2"
attr(data1$UR02x02,"3") = "3"
attr(data1$UR02x02,"4") = "4"
attr(data1$UR02x03,"1") = "1"
attr(data1$UR02x03,"2") = "2"
attr(data1$UR02x03,"3") = "3"
attr(data1$UR02x03,"4") = "4"
attr(data1$UR02x04,"1") = "1"
attr(data1$UR02x04,"2") = "2"
attr(data1$UR02x04,"3") = "3"
attr(data1$UR02x04,"4") = "4"
attr(data1$UR02x05,"1") = "1"
attr(data1$UR02x05,"2") = "2"
attr(data1$UR02x05,"3") = "3"
attr(data1$UR02x05,"4") = "4"
attr(data1$UR02x06,"1") = "1"
attr(data1$UR02x06,"2") = "2"
attr(data1$UR02x06,"3") = "3"
attr(data1$UR02x06,"4") = "4"
attr(data1$UR02x07,"1") = "1"
attr(data1$UR02x07,"2") = "2"
attr(data1$UR02x07,"3") = "3"
attr(data1$UR02x07,"4") = "4"
attr(data1$UR02x08,"1") = "1"
attr(data1$UR02x08,"2") = "2"
attr(data1$UR02x08,"3") = "3"
attr(data1$UR02x08,"4") = "4"
attr(data1$UR02x09,"1") = "1"
attr(data1$UR02x09,"2") = "2"
attr(data1$UR02x09,"3") = "3"
attr(data1$UR02x09,"4") = "4"
attr(data1$UR02x10,"1") = "1"
attr(data1$UR02x10,"2") = "2"
attr(data1$UR02x10,"3") = "3"
attr(data1$UR02x10,"4") = "4"
attr(data1$UR02x11,"1") = "1"
attr(data1$UR02x11,"2") = "2"
attr(data1$UR02x11,"3") = "3"
attr(data1$UR02x11,"4") = "4"
attr(data1$UR02x12,"1") = "1"
attr(data1$UR02x12,"2") = "2"
attr(data1$UR02x12,"3") = "3"
attr(data1$UR02x12,"4") = "4"
attr(data1$UR02x13,"1") = "1"
attr(data1$UR02x13,"2") = "2"
attr(data1$UR02x13,"3") = "3"
attr(data1$UR02x13,"4") = "4"
attr(data1$UR02x14,"1") = "1"
attr(data1$UR02x14,"2") = "2"
attr(data1$UR02x14,"3") = "3"
attr(data1$UR02x14,"4") = "4"
attr(data1$UR02x15,"1") = "1"
attr(data1$UR02x15,"2") = "2"
attr(data1$UR02x15,"3") = "3"
attr(data1$UR02x15,"4") = "4"
attr(data1$UR02x16,"1") = "1"
attr(data1$UR02x16,"2") = "2"
attr(data1$UR02x16,"3") = "3"
attr(data1$UR02x16,"4") = "4"
attr(data1$UR02x17,"1") = "1"
attr(data1$UR02x17,"2") = "2"
attr(data1$UR02x17,"3") = "3"
attr(data1$UR02x17,"4") = "4"
attr(data1$UR02x18,"1") = "1"
attr(data1$UR02x18,"2") = "2"
attr(data1$UR02x18,"3") = "3"
attr(data1$UR02x18,"4") = "4"
attr(data1$UR02x19,"1") = "1"
attr(data1$UR02x19,"2") = "2"
attr(data1$UR02x19,"3") = "3"
attr(data1$UR02x19,"4") = "4"
attr(data1$UR02x20,"1") = "1"
attr(data1$UR02x20,"2") = "2"
attr(data1$UR02x20,"3") = "3"
attr(data1$UR02x20,"4") = "4"
attr(data1$UR02x21,"1") = "1"
attr(data1$UR02x21,"2") = "2"
attr(data1$UR02x21,"3") = "3"
attr(data1$UR02x21,"4") = "4"
attr(data1$UR02x22,"1") = "1"
attr(data1$UR02x22,"2") = "2"
attr(data1$UR02x22,"3") = "3"
attr(data1$UR02x22,"4") = "4"
attr(data1$UR02x23,"1") = "1"
attr(data1$UR02x23,"2") = "2"
attr(data1$UR02x23,"3") = "3"
attr(data1$UR02x23,"4") = "4"
attr(data1$UR02x24,"1") = "1"
attr(data1$UR02x24,"2") = "2"
attr(data1$UR02x24,"3") = "3"
attr(data1$UR02x24,"4") = "4"
attr(data1$UR02x25,"1") = "1"
attr(data1$UR02x25,"2") = "2"
attr(data1$UR02x25,"3") = "3"
attr(data1$UR02x25,"4") = "4"
attr(data1$UR02x26,"1") = "1"
attr(data1$UR02x26,"2") = "2"
attr(data1$UR02x26,"3") = "3"
attr(data1$UR02x26,"4") = "4"
attr(data1$UR02x27,"1") = "1"
attr(data1$UR02x27,"2") = "2"
attr(data1$UR02x27,"3") = "3"
attr(data1$UR02x27,"4") = "4"
attr(data1$UR02x28,"1") = "1"
attr(data1$UR02x28,"2") = "2"
attr(data1$UR02x28,"3") = "3"
attr(data1$UR02x28,"4") = "4"
attr(data1$UR02x29,"1") = "1"
attr(data1$UR02x29,"2") = "2"
attr(data1$UR02x29,"3") = "3"
attr(data1$UR02x29,"4") = "4"
attr(data1$UR02x30,"1") = "1"
attr(data1$UR02x30,"2") = "2"
attr(data1$UR02x30,"3") = "3"
attr(data1$UR02x30,"4") = "4"
attr(data1$UR02x31,"1") = "1"
attr(data1$UR02x31,"2") = "2"
attr(data1$UR02x31,"3") = "3"
attr(data1$UR02x31,"4") = "4"
attr(data1$UR02x32,"1") = "1"
attr(data1$UR02x32,"2") = "2"
attr(data1$UR02x32,"3") = "3"
attr(data1$UR02x32,"4") = "4"
attr(data1$UR02x33,"1") = "1"
attr(data1$UR02x33,"2") = "2"
attr(data1$UR02x33,"3") = "3"
attr(data1$UR02x33,"4") = "4"
attr(data1$UR02x34,"1") = "1"
attr(data1$UR02x34,"2") = "2"
attr(data1$UR02x34,"3") = "3"
attr(data1$UR02x34,"4") = "4"
attr(data1$UR02x35,"1") = "1"
attr(data1$UR02x35,"2") = "2"
attr(data1$UR02x35,"3") = "3"
attr(data1$UR02x35,"4") = "4"
attr(data1$UR02x36,"1") = "1"
attr(data1$UR02x36,"2") = "2"
attr(data1$UR02x36,"3") = "3"
attr(data1$UR02x36,"4") = "4"
attr(data1$UR02x37,"1") = "1"
attr(data1$UR02x37,"2") = "2"
attr(data1$UR02x37,"3") = "3"
attr(data1$UR02x37,"4") = "4"
attr(data1$UR02x38,"1") = "1"
attr(data1$UR02x38,"2") = "2"
attr(data1$UR02x38,"3") = "3"
attr(data1$UR02x38,"4") = "4"
attr(data1$UR02x39,"1") = "1"
attr(data1$UR02x39,"2") = "2"
attr(data1$UR02x39,"3") = "3"
attr(data1$UR02x39,"4") = "4"
attr(data1$UR02x40,"1") = "1"
attr(data1$UR02x40,"2") = "2"
attr(data1$UR02x40,"3") = "3"
attr(data1$UR02x40,"4") = "4"
attr(data1$UR02x41,"1") = "1"
attr(data1$UR02x41,"2") = "2"
attr(data1$UR02x41,"3") = "3"
attr(data1$UR02x41,"4") = "4"
attr(data1$UR02x42,"1") = "1"
attr(data1$UR02x42,"2") = "2"
attr(data1$UR02x42,"3") = "3"
attr(data1$UR02x42,"4") = "4"
attr(data1$UR02x43,"1") = "1"
attr(data1$UR02x43,"2") = "2"
attr(data1$UR02x43,"3") = "3"
attr(data1$UR02x43,"4") = "4"
attr(data1$UR02x44,"1") = "1"
attr(data1$UR02x44,"2") = "2"
attr(data1$UR02x44,"3") = "3"
attr(data1$UR02x44,"4") = "4"
attr(data1$UR02x45,"1") = "1"
attr(data1$UR02x45,"2") = "2"
attr(data1$UR02x45,"3") = "3"
attr(data1$UR02x45,"4") = "4"
attr(data1$UR02x46,"1") = "1"
attr(data1$UR02x46,"2") = "2"
attr(data1$UR02x46,"3") = "3"
attr(data1$UR02x46,"4") = "4"
attr(data1$UR02x47,"1") = "1"
attr(data1$UR02x47,"2") = "2"
attr(data1$UR02x47,"3") = "3"
attr(data1$UR02x47,"4") = "4"
attr(data1$UR02x48,"1") = "1"
attr(data1$UR02x48,"2") = "2"
attr(data1$UR02x48,"3") = "3"
attr(data1$UR02x48,"4") = "4"
attr(data1$UR02x49,"1") = "1"
attr(data1$UR02x49,"2") = "2"
attr(data1$UR02x49,"3") = "3"
attr(data1$UR02x49,"4") = "4"
attr(data1$UR02x50,"1") = "1"
attr(data1$UR02x50,"2") = "2"
attr(data1$UR02x50,"3") = "3"
attr(data1$UR02x50,"4") = "4"
attr(data1$UR02x51,"1") = "1"
attr(data1$UR02x51,"2") = "2"
attr(data1$UR02x51,"3") = "3"
attr(data1$UR02x51,"4") = "4"
attr(data1$UR02x52,"1") = "1"
attr(data1$UR02x52,"2") = "2"
attr(data1$UR02x52,"3") = "3"
attr(data1$UR02x52,"4") = "4"
attr(data1$UR02x53,"1") = "1"
attr(data1$UR02x53,"2") = "2"
attr(data1$UR02x53,"3") = "3"
attr(data1$UR02x53,"4") = "4"
attr(data1$UR02x54,"1") = "1"
attr(data1$UR02x54,"2") = "2"
attr(data1$UR02x54,"3") = "3"
attr(data1$UR02x54,"4") = "4"
attr(data1$UR02x55,"1") = "1"
attr(data1$UR02x55,"2") = "2"
attr(data1$UR02x55,"3") = "3"
attr(data1$UR02x55,"4") = "4"
attr(data1$UR02x56,"1") = "1"
attr(data1$UR02x56,"2") = "2"
attr(data1$UR02x56,"3") = "3"
attr(data1$UR02x56,"4") = "4"
attr(data1$UR02x57,"1") = "1"
attr(data1$UR02x57,"2") = "2"
attr(data1$UR02x57,"3") = "3"
attr(data1$UR02x57,"4") = "4"
attr(data1$UR02x58,"1") = "1"
attr(data1$UR02x58,"2") = "2"
attr(data1$UR02x58,"3") = "3"
attr(data1$UR02x58,"4") = "4"
attr(data1$UR02x59,"1") = "1"
attr(data1$UR02x59,"2") = "2"
attr(data1$UR02x59,"3") = "3"
attr(data1$UR02x59,"4") = "4"
attr(data1$UR02x60,"1") = "1"
attr(data1$UR02x60,"2") = "2"
attr(data1$UR02x60,"3") = "3"
attr(data1$UR02x60,"4") = "4"
attr(data1$UR02x61,"1") = "1"
attr(data1$UR02x61,"2") = "2"
attr(data1$UR02x61,"3") = "3"
attr(data1$UR02x61,"4") = "4"
attr(data1$UR02x62,"1") = "1"
attr(data1$UR02x62,"2") = "2"
attr(data1$UR02x62,"3") = "3"
attr(data1$UR02x62,"4") = "4"
attr(data1$UR02x63,"1") = "1"
attr(data1$UR02x63,"2") = "2"
attr(data1$UR02x63,"3") = "3"
attr(data1$UR02x63,"4") = "4"
attr(data1$UR02x64,"1") = "1"
attr(data1$UR02x64,"2") = "2"
attr(data1$UR02x64,"3") = "3"
attr(data1$UR02x64,"4") = "4"
attr(data1$UR02x65,"1") = "1"
attr(data1$UR02x65,"2") = "2"
attr(data1$UR02x65,"3") = "3"
attr(data1$UR02x65,"4") = "4"
attr(data1$UR02x66,"1") = "1"
attr(data1$UR02x66,"2") = "2"
attr(data1$UR02x66,"3") = "3"
attr(data1$UR02x66,"4") = "4"
attr(data1$UR02x67,"1") = "1"
attr(data1$UR02x67,"2") = "2"
attr(data1$UR02x67,"3") = "3"
attr(data1$UR02x67,"4") = "4"
attr(data1$UR02x68,"1") = "1"
attr(data1$UR02x68,"2") = "2"
attr(data1$UR02x68,"3") = "3"
attr(data1$UR02x68,"4") = "4"
attr(data1$UR02x69,"1") = "1"
attr(data1$UR02x69,"2") = "2"
attr(data1$UR02x69,"3") = "3"
attr(data1$UR02x69,"4") = "4"
attr(data1$UR02x70,"1") = "1"
attr(data1$UR02x70,"2") = "2"
attr(data1$UR02x70,"3") = "3"
attr(data1$UR02x70,"4") = "4"
attr(data1$UR02x71,"1") = "1"
attr(data1$UR02x71,"2") = "2"
attr(data1$UR02x71,"3") = "3"
attr(data1$UR02x71,"4") = "4"
attr(data1$UR02x72,"1") = "1"
attr(data1$UR02x72,"2") = "2"
attr(data1$UR02x72,"3") = "3"
attr(data1$UR02x72,"4") = "4"
attr(data1$UR02x73,"1") = "1"
attr(data1$UR02x73,"2") = "2"
attr(data1$UR02x73,"3") = "3"
attr(data1$UR02x73,"4") = "4"
attr(data1$UR02x74,"1") = "1"
attr(data1$UR02x74,"2") = "2"
attr(data1$UR02x74,"3") = "3"
attr(data1$UR02x74,"4") = "4"
attr(data1$UR02x75,"1") = "1"
attr(data1$UR02x75,"2") = "2"
attr(data1$UR02x75,"3") = "3"
attr(data1$UR02x75,"4") = "4"
attr(data1$UR02x76,"1") = "1"
attr(data1$UR02x76,"2") = "2"
attr(data1$UR02x76,"3") = "3"
attr(data1$UR02x76,"4") = "4"
attr(data1$UR02x77,"1") = "1"
attr(data1$UR02x77,"2") = "2"
attr(data1$UR02x77,"3") = "3"
attr(data1$UR02x77,"4") = "4"
attr(data1$UR02x78,"1") = "1"
attr(data1$UR02x78,"2") = "2"
attr(data1$UR02x78,"3") = "3"
attr(data1$UR02x78,"4") = "4"
attr(data1$UR02x79,"1") = "1"
attr(data1$UR02x79,"2") = "2"
attr(data1$UR02x79,"3") = "3"
attr(data1$UR02x79,"4") = "4"
attr(data1$UR02x80,"1") = "1"
attr(data1$UR02x80,"2") = "2"
attr(data1$UR02x80,"3") = "3"
attr(data1$UR02x80,"4") = "4"
attr(data1$UR02x81,"1") = "1"
attr(data1$UR02x81,"2") = "2"
attr(data1$UR02x81,"3") = "3"
attr(data1$UR02x81,"4") = "4"
attr(data1$UR02x82,"1") = "1"
attr(data1$UR02x82,"2") = "2"
attr(data1$UR02x82,"3") = "3"
attr(data1$UR02x82,"4") = "4"
attr(data1$UR02x83,"1") = "1"
attr(data1$UR02x83,"2") = "2"
attr(data1$UR02x83,"3") = "3"
attr(data1$UR02x83,"4") = "4"
attr(data1$UR02x84,"1") = "1"
attr(data1$UR02x84,"2") = "2"
attr(data1$UR02x84,"3") = "3"
attr(data1$UR02x84,"4") = "4"
attr(data1$TR01_01a,"-1") = "Mensuration impossible"
attr(data1$TR01_02a,"-1") = "Mensuration impossible"
attr(data1$TR01_03a,"-1") = "Mensuration impossible"
attr(data1$TR01_04a,"-1") = "Mensuration impossible"
attr(data1$TR01_05a,"-1") = "Mensuration impossible"
attr(data1$TR01_06a,"-1") = "Mensuration impossible"
attr(data1$TR01_07a,"-1") = "Mensuration impossible"
attr(data1$TR01_08a,"-1") = "Mensuration impossible"
attr(data1$TR01_09a,"-1") = "Mensuration impossible"
attr(data1$TR01_10a,"-1") = "Mensuration impossible"
attr(data1$TR01_11a,"-1") = "Mensuration impossible"
attr(data1$TR01_12a,"-1") = "Mensuration impossible"
attr(data1$TR01_13a,"-1") = "Mensuration impossible"
attr(data1$TR01_14a,"-1") = "Mensuration impossible"
attr(data1$TR01_15a,"-1") = "Mensuration impossible"
attr(data1$TR01_16a,"-1") = "Mensuration impossible"
attr(data1$TR02_01a,"-1") = "Mensuration impossible"
attr(data1$TR02_02a,"-1") = "Mensuration impossible"
attr(data1$TR02_03a,"-1") = "Mensuration impossible"
attr(data1$TR02_04a,"-1") = "Mensuration impossible"
attr(data1$TR02_05a,"-1") = "Mensuration impossible"
attr(data1$TR02_06a,"-1") = "Mensuration impossible"
attr(data1$TR02_07a,"-1") = "Mensuration impossible"
attr(data1$TR02_08a,"-1") = "Mensuration impossible"
attr(data1$TR02_09a,"-1") = "Mensuration impossible"
attr(data1$TR02_10a,"-1") = "Mensuration impossible"
attr(data1$TR02_11a,"-1") = "Mensuration impossible"
attr(data1$TR02_12a,"-1") = "Mensuration impossible"
attr(data1$TR02_13a,"-1") = "Mensuration impossible"
attr(data1$TR02_14a,"-1") = "Mensuration impossible"
attr(data1$TR02_15a,"-1") = "Mensuration impossible"
attr(data1$TR02_16a,"-1") = "Mensuration impossible"
attr(data1$TR02_17a,"-1") = "Mensuration impossible"
attr(data1$TR02_18a,"-1") = "Mensuration impossible"
attr(data1$TR02_19a,"-1") = "Mensuration impossible"
attr(data1$TR02_20a,"-1") = "Mensuration impossible"
attr(data1$TR02_21a,"-1") = "Mensuration impossible"
attr(data1$TR02_22a,"-1") = "Mensuration impossible"
attr(data1$TR02_23a,"-1") = "Mensuration impossible"
attr(data1$TR02_24a,"-1") = "Mensuration impossible"
attr(data1$TR02_25a,"-1") = "Mensuration impossible"
attr(data1$TR02_26a,"-1") = "Mensuration impossible"
attr(data1$TR02_27a,"-1") = "Mensuration impossible"
attr(data1$TR02_28a,"-1") = "Mensuration impossible"
attr(data1$TR02_29a,"-1") = "Mensuration impossible"
attr(data1$TR02_30a,"-1") = "Mensuration impossible"
attr(data1$TR02_31a,"-1") = "Mensuration impossible"
attr(data1$TR02_32a,"-1") = "Mensuration impossible"
attr(data1$TR02_33a,"-1") = "Mensuration impossible"
attr(data1$TR02_34a,"-1") = "Mensuration impossible"
attr(data1$TR02_35a,"-1") = "Mensuration impossible"
attr(data1$TR02_36a,"-1") = "Mensuration impossible"
attr(data1$TR02_37a,"-1") = "Mensuration impossible"
attr(data1$TR02_38a,"-1") = "Mensuration impossible"
attr(data1$TR02_39a,"-1") = "Mensuration impossible"
attr(data1$TR02_40a,"-1") = "Mensuration impossible"
attr(data1$TR02_41a,"-1") = "Mensuration impossible"
attr(data1$TR02_42a,"-1") = "Mensuration impossible"
attr(data1$TR02_43a,"-1") = "Mensuration impossible"
attr(data1$TR02_44a,"-1") = "Mensuration impossible"
attr(data1$TR02_45a,"-1") = "Mensuration impossible"
attr(data1$TR02_46a,"-1") = "Mensuration impossible"
attr(data1$TR02_47a,"-1") = "Mensuration impossible"
attr(data1$TR02_48a,"-1") = "Mensuration impossible"
attr(data1$TR02_49a,"-1") = "Mensuration impossible"
attr(data1$TR02_50a,"-1") = "Mensuration impossible"
attr(data1$TR02_51a,"-1") = "Mensuration impossible"
attr(data1$TR02_52a,"-1") = "Mensuration impossible"
attr(data1$TR02_53a,"-1") = "Mensuration impossible"
attr(data1$TR02_54a,"-1") = "Mensuration impossible"
attr(data1$TR02_55a,"-1") = "Mensuration impossible"
attr(data1$TR02_56a,"-1") = "Mensuration impossible"
attr(data1$TR02_57a,"-1") = "Mensuration impossible"
attr(data1$TR02_58a,"-1") = "Mensuration impossible"
attr(data1$TR02_59a,"-1") = "Mensuration impossible"
attr(data1$TR02_60a,"-1") = "Mensuration impossible"
attr(data1$TR02_61a,"-1") = "Mensuration impossible"
attr(data1$TR02_62a,"-1") = "Mensuration impossible"
attr(data1$TR02_63a,"-1") = "Mensuration impossible"
attr(data1$TR02_64a,"-1") = "Mensuration impossible"
attr(data1$TR02_65a,"-1") = "Mensuration impossible"
attr(data1$TR02_66a,"-1") = "Mensuration impossible"
attr(data1$TR02_67a,"-1") = "Mensuration impossible"
attr(data1$TR02_68a,"-1") = "Mensuration impossible"
attr(data1$TR02_69a,"-1") = "Mensuration impossible"
attr(data1$TR02_70a,"-1") = "Mensuration impossible"
attr(data1$TR02_71a,"-1") = "Mensuration impossible"
attr(data1$TR02_72a,"-1") = "Mensuration impossible"
attr(data1$TR02_73a,"-1") = "Mensuration impossible"
attr(data1$TR02_74a,"-1") = "Mensuration impossible"
attr(data1$TR02_75a,"-1") = "Mensuration impossible"
attr(data1$TR02_76a,"-1") = "Mensuration impossible"
attr(data1$TR02_77a,"-1") = "Mensuration impossible"
attr(data1$TR02_78a,"-1") = "Mensuration impossible"
attr(data1$TR02_79a,"-1") = "Mensuration impossible"
attr(data1$TR02_80a,"-1") = "Mensuration impossible"
attr(data1$TR02_81a,"-1") = "Mensuration impossible"
attr(data1$TR02_82a,"-1") = "Mensuration impossible"
attr(data1$TR02_83a,"-1") = "Mensuration impossible"
attr(data1$TR02_84a,"-1") = "Mensuration impossible"
attr(data1$DM11_01,"F") = "Not checked"
attr(data1$DM11_01,"T") = "Checked"
attr(data1$DV01_01,"1") = "group1.png"
attr(data1$DV01_01,"101") = "group2.png"
attr(data1$DV02_01,"1") = "group1.png"
attr(data1$DV02_01,"101") = "group2.png"
attr(data1$DV03_01,"1") = "0 %"
attr(data1$DV03_01,"101") = "100 %"
attr(data1$DV03_02,"1") = "0 %"
attr(data1$DV03_02,"101") = "100 %"
attr(data1$DV04_01,"1") = "0 %"
attr(data1$DV04_01,"101") = "100 %"
attr(data1$DV04_02,"1") = "0 %"
attr(data1$DV04_02,"101") = "100 %"
attr(data1$DV05_01,"1") = "not confident at all"
attr(data1$DV05_01,"101") = "very confident"
attr(data1$DV05_02,"1") = "not confident at all"
attr(data1$DV05_02,"101") = "very confident"
attr(data1$DV06_01,"1") = "not confident at all"
attr(data1$DV06_01,"101") = "very confident"
attr(data1$DV06_02,"1") = "not confident at all"
attr(data1$DV06_02,"101") = "very confident"
attr(data1$FINISHED,"F") = "Canceled"
attr(data1$FINISHED,"T") = "Finished"
attr(data1$Q_VIEWER,"F") = "Respondent"
attr(data1$Q_VIEWER,"T") = "Spectator"
comment(data1$SERIAL) = "Serial number (if provided)"
comment(data1$REF) = "Reference (if provided in link)"
comment(data1$QUESTNNR) = "Questionnaire that has been used in the interview"
comment(data1$MODE) = "Interview mode"
comment(data1$STARTED) = "Time the interview has started (Europe/Berlin)"
comment(data1$UR01_CP) = "Condition: Complete clearances of the ballot, yet"
comment(data1$UR01) = "Condition: Code drawn"
comment(data1$UR02_CP) = "Trials: Complete clearances of the ballot, yet"
comment(data1$UR02x01) = "Trials: Code drawn (1)"
comment(data1$UR02x02) = "Trials: Code drawn (2)"
comment(data1$UR02x03) = "Trials: Code drawn (3)"
comment(data1$UR02x04) = "Trials: Code drawn (4)"
comment(data1$UR02x05) = "Trials: Code drawn (5)"
comment(data1$UR02x06) = "Trials: Code drawn (6)"
comment(data1$UR02x07) = "Trials: Code drawn (7)"
comment(data1$UR02x08) = "Trials: Code drawn (8)"
comment(data1$UR02x09) = "Trials: Code drawn (9)"
comment(data1$UR02x10) = "Trials: Code drawn (10)"
comment(data1$UR02x11) = "Trials: Code drawn (11)"
comment(data1$UR02x12) = "Trials: Code drawn (12)"
comment(data1$UR02x13) = "Trials: Code drawn (13)"
comment(data1$UR02x14) = "Trials: Code drawn (14)"
comment(data1$UR02x15) = "Trials: Code drawn (15)"
comment(data1$UR02x16) = "Trials: Code drawn (16)"
comment(data1$UR02x17) = "Trials: Code drawn (17)"
comment(data1$UR02x18) = "Trials: Code drawn (18)"
comment(data1$UR02x19) = "Trials: Code drawn (19)"
comment(data1$UR02x20) = "Trials: Code drawn (20)"
comment(data1$UR02x21) = "Trials: Code drawn (21)"
comment(data1$UR02x22) = "Trials: Code drawn (22)"
comment(data1$UR02x23) = "Trials: Code drawn (23)"
comment(data1$UR02x24) = "Trials: Code drawn (24)"
comment(data1$UR02x25) = "Trials: Code drawn (25)"
comment(data1$UR02x26) = "Trials: Code drawn (26)"
comment(data1$UR02x27) = "Trials: Code drawn (27)"
comment(data1$UR02x28) = "Trials: Code drawn (28)"
comment(data1$UR02x29) = "Trials: Code drawn (29)"
comment(data1$UR02x30) = "Trials: Code drawn (30)"
comment(data1$UR02x31) = "Trials: Code drawn (31)"
comment(data1$UR02x32) = "Trials: Code drawn (32)"
comment(data1$UR02x33) = "Trials: Code drawn (33)"
comment(data1$UR02x34) = "Trials: Code drawn (34)"
comment(data1$UR02x35) = "Trials: Code drawn (35)"
comment(data1$UR02x36) = "Trials: Code drawn (36)"
comment(data1$UR02x37) = "Trials: Code drawn (37)"
comment(data1$UR02x38) = "Trials: Code drawn (38)"
comment(data1$UR02x39) = "Trials: Code drawn (39)"
comment(data1$UR02x40) = "Trials: Code drawn (40)"
comment(data1$UR02x41) = "Trials: Code drawn (41)"
comment(data1$UR02x42) = "Trials: Code drawn (42)"
comment(data1$UR02x43) = "Trials: Code drawn (43)"
comment(data1$UR02x44) = "Trials: Code drawn (44)"
comment(data1$UR02x45) = "Trials: Code drawn (45)"
comment(data1$UR02x46) = "Trials: Code drawn (46)"
comment(data1$UR02x47) = "Trials: Code drawn (47)"
comment(data1$UR02x48) = "Trials: Code drawn (48)"
comment(data1$UR02x49) = "Trials: Code drawn (49)"
comment(data1$UR02x50) = "Trials: Code drawn (50)"
comment(data1$UR02x51) = "Trials: Code drawn (51)"
comment(data1$UR02x52) = "Trials: Code drawn (52)"
comment(data1$UR02x53) = "Trials: Code drawn (53)"
comment(data1$UR02x54) = "Trials: Code drawn (54)"
comment(data1$UR02x55) = "Trials: Code drawn (55)"
comment(data1$UR02x56) = "Trials: Code drawn (56)"
comment(data1$UR02x57) = "Trials: Code drawn (57)"
comment(data1$UR02x58) = "Trials: Code drawn (58)"
comment(data1$UR02x59) = "Trials: Code drawn (59)"
comment(data1$UR02x60) = "Trials: Code drawn (60)"
comment(data1$UR02x61) = "Trials: Code drawn (61)"
comment(data1$UR02x62) = "Trials: Code drawn (62)"
comment(data1$UR02x63) = "Trials: Code drawn (63)"
comment(data1$UR02x64) = "Trials: Code drawn (64)"
comment(data1$UR02x65) = "Trials: Code drawn (65)"
comment(data1$UR02x66) = "Trials: Code drawn (66)"
comment(data1$UR02x67) = "Trials: Code drawn (67)"
comment(data1$UR02x68) = "Trials: Code drawn (68)"
comment(data1$UR02x69) = "Trials: Code drawn (69)"
comment(data1$UR02x70) = "Trials: Code drawn (70)"
comment(data1$UR02x71) = "Trials: Code drawn (71)"
comment(data1$UR02x72) = "Trials: Code drawn (72)"
comment(data1$UR02x73) = "Trials: Code drawn (73)"
comment(data1$UR02x74) = "Trials: Code drawn (74)"
comment(data1$UR02x75) = "Trials: Code drawn (75)"
comment(data1$UR02x76) = "Trials: Code drawn (76)"
comment(data1$UR02x77) = "Trials: Code drawn (77)"
comment(data1$UR02x78) = "Trials: Code drawn (78)"
comment(data1$UR02x79) = "Trials: Code drawn (79)"
comment(data1$UR02x80) = "Trials: Code drawn (80)"
comment(data1$UR02x81) = "Trials: Code drawn (81)"
comment(data1$UR02x82) = "Trials: Code drawn (82)"
comment(data1$UR02x83) = "Trials: Code drawn (83)"
comment(data1$UR02x84) = "Trials: Code drawn (84)"
comment(data1$TR01_01) = "Forced: %forced%"
comment(data1$TR01_01a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_02) = "Forced: %forced%"
comment(data1$TR01_02a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_03) = "Forced: %forced%"
comment(data1$TR01_03a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_04) = "Forced: %forced%"
comment(data1$TR01_04a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_05) = "Forced: %forced%"
comment(data1$TR01_05a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_06) = "Forced: %forced%"
comment(data1$TR01_06a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_07) = "Forced: %forced%"
comment(data1$TR01_07a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_08) = "Forced: %forced%"
comment(data1$TR01_08a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_09) = "Forced: %forced%"
comment(data1$TR01_09a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_10) = "Forced: %forced%"
comment(data1$TR01_10a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_11) = "Forced: %forced%"
comment(data1$TR01_11a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_12) = "Forced: %forced%"
comment(data1$TR01_12a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_13) = "Forced: %forced%"
comment(data1$TR01_13a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_14) = "Forced: %forced%"
comment(data1$TR01_14a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_15) = "Forced: %forced%"
comment(data1$TR01_15a) = "Forced: %forced% response time [ms]"
comment(data1$TR01_16) = "Forced: %forced%"
comment(data1$TR01_16a) = "Forced: %forced% response time [ms]"
comment(data1$TR02_01) = "Free: "
comment(data1$TR02_01a) = "Free:  response time [ms]"
comment(data1$TR02_02) = "Free: "
comment(data1$TR02_02a) = "Free:  response time [ms]"
comment(data1$TR02_03) = "Free: "
comment(data1$TR02_03a) = "Free:  response time [ms]"
comment(data1$TR02_04) = "Free: "
comment(data1$TR02_04a) = "Free:  response time [ms]"
comment(data1$TR02_05) = "Free: "
comment(data1$TR02_05a) = "Free:  response time [ms]"
comment(data1$TR02_06) = "Free: "
comment(data1$TR02_06a) = "Free:  response time [ms]"
comment(data1$TR02_07) = "Free: "
comment(data1$TR02_07a) = "Free:  response time [ms]"
comment(data1$TR02_08) = "Free: "
comment(data1$TR02_08a) = "Free:  response time [ms]"
comment(data1$TR02_09) = "Free: "
comment(data1$TR02_09a) = "Free:  response time [ms]"
comment(data1$TR02_10) = "Free: "
comment(data1$TR02_10a) = "Free:  response time [ms]"
comment(data1$TR02_11) = "Free: "
comment(data1$TR02_11a) = "Free:  response time [ms]"
comment(data1$TR02_12) = "Free: "
comment(data1$TR02_12a) = "Free:  response time [ms]"
comment(data1$TR02_13) = "Free: "
comment(data1$TR02_13a) = "Free:  response time [ms]"
comment(data1$TR02_14) = "Free: "
comment(data1$TR02_14a) = "Free:  response time [ms]"
comment(data1$TR02_15) = "Free: "
comment(data1$TR02_15a) = "Free:  response time [ms]"
comment(data1$TR02_16) = "Free: "
comment(data1$TR02_16a) = "Free:  response time [ms]"
comment(data1$TR02_17) = "Free: "
comment(data1$TR02_17a) = "Free:  response time [ms]"
comment(data1$TR02_18) = "Free: "
comment(data1$TR02_18a) = "Free:  response time [ms]"
comment(data1$TR02_19) = "Free: "
comment(data1$TR02_19a) = "Free:  response time [ms]"
comment(data1$TR02_20) = "Free: "
comment(data1$TR02_20a) = "Free:  response time [ms]"
comment(data1$TR02_21) = "Free: "
comment(data1$TR02_21a) = "Free:  response time [ms]"
comment(data1$TR02_22) = "Free: "
comment(data1$TR02_22a) = "Free:  response time [ms]"
comment(data1$TR02_23) = "Free: "
comment(data1$TR02_23a) = "Free:  response time [ms]"
comment(data1$TR02_24) = "Free: "
comment(data1$TR02_24a) = "Free:  response time [ms]"
comment(data1$TR02_25) = "Free: "
comment(data1$TR02_25a) = "Free:  response time [ms]"
comment(data1$TR02_26) = "Free: "
comment(data1$TR02_26a) = "Free:  response time [ms]"
comment(data1$TR02_27) = "Free: "
comment(data1$TR02_27a) = "Free:  response time [ms]"
comment(data1$TR02_28) = "Free: "
comment(data1$TR02_28a) = "Free:  response time [ms]"
comment(data1$TR02_29) = "Free: "
comment(data1$TR02_29a) = "Free:  response time [ms]"
comment(data1$TR02_30) = "Free: "
comment(data1$TR02_30a) = "Free:  response time [ms]"
comment(data1$TR02_31) = "Free: "
comment(data1$TR02_31a) = "Free:  response time [ms]"
comment(data1$TR02_32) = "Free: "
comment(data1$TR02_32a) = "Free:  response time [ms]"
comment(data1$TR02_33) = "Free: "
comment(data1$TR02_33a) = "Free:  response time [ms]"
comment(data1$TR02_34) = "Free: "
comment(data1$TR02_34a) = "Free:  response time [ms]"
comment(data1$TR02_35) = "Free: "
comment(data1$TR02_35a) = "Free:  response time [ms]"
comment(data1$TR02_36) = "Free: "
comment(data1$TR02_36a) = "Free:  response time [ms]"
comment(data1$TR02_37) = "Free: "
comment(data1$TR02_37a) = "Free:  response time [ms]"
comment(data1$TR02_38) = "Free: "
comment(data1$TR02_38a) = "Free:  response time [ms]"
comment(data1$TR02_39) = "Free: "
comment(data1$TR02_39a) = "Free:  response time [ms]"
comment(data1$TR02_40) = "Free: "
comment(data1$TR02_40a) = "Free:  response time [ms]"
comment(data1$TR02_41) = "Free: "
comment(data1$TR02_41a) = "Free:  response time [ms]"
comment(data1$TR02_42) = "Free: "
comment(data1$TR02_42a) = "Free:  response time [ms]"
comment(data1$TR02_43) = "Free: "
comment(data1$TR02_43a) = "Free:  response time [ms]"
comment(data1$TR02_44) = "Free: "
comment(data1$TR02_44a) = "Free:  response time [ms]"
comment(data1$TR02_45) = "Free: "
comment(data1$TR02_45a) = "Free:  response time [ms]"
comment(data1$TR02_46) = "Free: "
comment(data1$TR02_46a) = "Free:  response time [ms]"
comment(data1$TR02_47) = "Free: "
comment(data1$TR02_47a) = "Free:  response time [ms]"
comment(data1$TR02_48) = "Free: "
comment(data1$TR02_48a) = "Free:  response time [ms]"
comment(data1$TR02_49) = "Free: "
comment(data1$TR02_49a) = "Free:  response time [ms]"
comment(data1$TR02_50) = "Free: "
comment(data1$TR02_50a) = "Free:  response time [ms]"
comment(data1$TR02_51) = "Free: "
comment(data1$TR02_51a) = "Free:  response time [ms]"
comment(data1$TR02_52) = "Free: "
comment(data1$TR02_52a) = "Free:  response time [ms]"
comment(data1$TR02_53) = "Free: "
comment(data1$TR02_53a) = "Free:  response time [ms]"
comment(data1$TR02_54) = "Free: "
comment(data1$TR02_54a) = "Free:  response time [ms]"
comment(data1$TR02_55) = "Free: "
comment(data1$TR02_55a) = "Free:  response time [ms]"
comment(data1$TR02_56) = "Free: "
comment(data1$TR02_56a) = "Free:  response time [ms]"
comment(data1$TR02_57) = "Free: "
comment(data1$TR02_57a) = "Free:  response time [ms]"
comment(data1$TR02_58) = "Free: "
comment(data1$TR02_58a) = "Free:  response time [ms]"
comment(data1$TR02_59) = "Free: "
comment(data1$TR02_59a) = "Free:  response time [ms]"
comment(data1$TR02_60) = "Free: "
comment(data1$TR02_60a) = "Free:  response time [ms]"
comment(data1$TR02_61) = "Free: "
comment(data1$TR02_61a) = "Free:  response time [ms]"
comment(data1$TR02_62) = "Free: "
comment(data1$TR02_62a) = "Free:  response time [ms]"
comment(data1$TR02_63) = "Free: "
comment(data1$TR02_63a) = "Free:  response time [ms]"
comment(data1$TR02_64) = "Free: "
comment(data1$TR02_64a) = "Free:  response time [ms]"
comment(data1$TR02_65) = "Free: "
comment(data1$TR02_65a) = "Free:  response time [ms]"
comment(data1$TR02_66) = "Free: "
comment(data1$TR02_66a) = "Free:  response time [ms]"
comment(data1$TR02_67) = "Free: "
comment(data1$TR02_67a) = "Free:  response time [ms]"
comment(data1$TR02_68) = "Free: "
comment(data1$TR02_68a) = "Free:  response time [ms]"
comment(data1$TR02_69) = "Free: "
comment(data1$TR02_69a) = "Free:  response time [ms]"
comment(data1$TR02_70) = "Free: "
comment(data1$TR02_70a) = "Free:  response time [ms]"
comment(data1$TR02_71) = "Free: "
comment(data1$TR02_71a) = "Free:  response time [ms]"
comment(data1$TR02_72) = "Free: "
comment(data1$TR02_72a) = "Free:  response time [ms]"
comment(data1$TR02_73) = "Free: "
comment(data1$TR02_73a) = "Free:  response time [ms]"
comment(data1$TR02_74) = "Free: "
comment(data1$TR02_74a) = "Free:  response time [ms]"
comment(data1$TR02_75) = "Free: "
comment(data1$TR02_75a) = "Free:  response time [ms]"
comment(data1$TR02_76) = "Free: "
comment(data1$TR02_76a) = "Free:  response time [ms]"
comment(data1$TR02_77) = "Free: "
comment(data1$TR02_77a) = "Free:  response time [ms]"
comment(data1$TR02_78) = "Free: "
comment(data1$TR02_78a) = "Free:  response time [ms]"
comment(data1$TR02_79) = "Free: "
comment(data1$TR02_79a) = "Free:  response time [ms]"
comment(data1$TR02_80) = "Free: "
comment(data1$TR02_80a) = "Free:  response time [ms]"
comment(data1$TR02_81) = "Free: "
comment(data1$TR02_81a) = "Free:  response time [ms]"
comment(data1$TR02_82) = "Free: "
comment(data1$TR02_82a) = "Free:  response time [ms]"
comment(data1$TR02_83) = "Free: "
comment(data1$TR02_83a) = "Free:  response time [ms]"
comment(data1$TR02_84) = "Free: "
comment(data1$TR02_84a) = "Free:  response time [ms]"
comment(data1$IV01_RV1) = "POST/GET Variable: PROLIFIC_PID"
comment(data1$IV01_REF) = "Referer (HTTP_REFERER)"
comment(data1$IV02_01) = "Internal: Pageorder"
comment(data1$IV02_02) = "Internal: account"
comment(data1$DM03) = "AttCheck"
comment(data1$DM04) = "Age"
comment(data1$DM05) = "Gender"
comment(data1$DM06) = "Psychstudent"
comment(data1$DM07) = "Education"
comment(data1$DM10_01) = "Comments: [01]"
comment(data1$DM11) = "consent: Residual option (negative) or number of selected options"
comment(data1$DM11_01) = "consent: I agree and understand all the points listed above and would like to participate in this study."
comment(data1$DV01_01) = "Preference_pre: group1.png/group2.png"
comment(data1$DV02_01) = "Preference_post: group1.png/group2.png"
comment(data1$DV03_01) = "Conditionals_pre: ...you stopped someone from group 1?"
comment(data1$DV03_02) = "Conditionals_pre: ...you stopped someone from group 2?"
comment(data1$DV04_01) = "Conditionals_post: ...you stopped someone from group 1?"
comment(data1$DV04_02) = "Conditionals_post: ...you stopped someone from group 2?"
comment(data1$DV05_01) = "Confidence_pre: How confident are you that you can make a reasonable estimate regarding group 1?"
comment(data1$DV05_02) = "Confidence_pre: How confident are you that you can make a reasonable estimate regarding group 2?"
comment(data1$DV06_01) = "Confidence_post: How confident are you that you can make a reasonable estimate regarding group 1?"
comment(data1$DV06_02) = "Confidence_post: How confident are you that you can make a reasonable estimate regarding group 2?"
comment(data1$TIME001) = "Time spent on page 1"
comment(data1$TIME002) = "Time spent on page 2"
comment(data1$TIME003) = "Time spent on page 3"
comment(data1$TIME004) = "Time spent on page 4"
comment(data1$TIME005) = "Time spent on page 5"
comment(data1$TIME006) = "Time spent on page 6"
comment(data1$TIME007) = "Time spent on page 7"
comment(data1$TIME008) = "Time spent on page 8"
comment(data1$TIME009) = "Time spent on page 9"
comment(data1$TIME010) = "Time spent on page 10"
comment(data1$TIME011) = "Time spent on page 11"
comment(data1$TIME012) = "Time spent on page 12"
comment(data1$TIME013) = "Time spent on page 13"
comment(data1$TIME014) = "Time spent on page 14"
comment(data1$TIME015) = "Time spent on page 15"
comment(data1$TIME016) = "Time spent on page 16"
comment(data1$TIME017) = "Time spent on page 17"
comment(data1$TIME_SUM) = "Time spent overall (except outliers)"
comment(data1$MAILSENT) = "Time when the invitation mailing was sent (personally identifiable recipients, only)"
comment(data1$LASTDATA) = "Time when the data was most recently updated"
comment(data1$FINISHED) = "Has the interview been finished (reached last page)?"
comment(data1$Q_VIEWER) = "Did the respondent only view the questionnaire, omitting mandatory questions?"
comment(data1$LASTPAGE) = "Last page that the participant has handled in the questionnaire"
comment(data1$MAXPAGE) = "Hindmost page handled by the participant"
comment(data1$MISSING) = "Missing answers in percent"
comment(data1$MISSREL) = "Missing answers (weighted by relevance)"
comment(data1$TIME_RSI) = "Degradation points for being very fast"
comment(data1$DEG_TIME) = "Degradation points for being very fast"



# Assure that the comments are retained in subsets
as.data.frame.avector = as.data.frame.vector
`[.avector` <- function(x,i,...) {
  r <- NextMethod("[")
  mostattributes(r) <- attributes(x)
  r
}
data1_tmp = data.frame(
  lapply(data1, function(x) {
    structure( x, class = c("avector", class(x) ) )
  } )
)
mostattributes(data1_tmp) = attributes(data1)
data1 = data1_tmp
rm(data1_tmp)

