install.packages("RColorBrewer")
install.packages("tm")
install.packages("wordcloud")
install.packages('base64enc')
install.packages('ROAuth')
install.packages('plyr')
install.packages('stringr')
install.packages('twitteR')

library(RColorBrewer)
library(wordcloud)
library(tm)
library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(base64enc)

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

setup_twitter_oauth(consumerKey,
                    consumerSecret,
                    accessToken,
                    accessTokenSecret) 
consumerKey <- "UeMNSM6cJ7EX1LLTLwJPKSUVs"
consumerSecret <- "vFLrWEShIthtOGeFlecxROwARJuLfVAr94Orw9XuiecZxBb8VH"
accessToken <- "3102247269-VcUv9sX5kGKnDKe5JyFWcMFFDAeLSdbDdEfxnHn"
accessTokenSecret <- "QvG9DROx58Kv7xmqROlCUI4j5DotrnipdY1leMDphoZkV"

Objectname <- searchTwitter(searchString, n=no.oftweets, lang=NULL)

accessToken <- "3102247269-VcUv9sX5kGKnDKe5JyFWcMFFDAeLSdbDdEfxnHn"
insta <- searchTwitter('#GLA',n=30,lang ='en')
insta

insta <- searchTwitter('#instagramlogo',n=30,lang ='en')
insta

insta <- searchTwitter('#pari',n=30,lang ='en')
insta

insta <- searchTwitter('#Pari',n=30,lang ='en')
insta
length (insta)

tweet=userTimeline('@BarackObama',n=10)
tweet

homeTimeline (n=15)

mentions (n=15)

insta <- searchTwitter('#RamNavami',n=30,lang ='en')
insta


install.packages("SnowballC")
library(wordcloud)
library(SnowballC)
library(tm)

insta <- searchTwitter('#ChaloChamparan', n=30, lang='en')
insta_text <- sapply(insta, function(x) x$getText())
insta_text_corpus <- Corpus(VectorSource(insta_text))
insta_text_corpus <- tm_map(insta_text_corpus, removePunctuation)
insta_text_corpus <- tm_map(insta_text_corpus, content_transformer(tolower))
insta_text_corpus <- tm_map(insta_text_corpus, function(x)removeWords(x,stopwords()))
insta_text_corpus <- tm_map(insta_text_corpus, removeWords, c("RT", "are","that"))
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
insta_text_corpus <- tm_map(insta_text_corpus, content_transformer(removeURL))

insta_2 <- TermDocumentMatrix(insta_text_corpus)
insta_2 <- as.matrix(insta_2)
insta_2 <- sort(rowSums(insta_2),decreasing=TRUE)

insta_2 <- data.frame(word = names(insta_2),freq=insta_2)

barplot(insta_2[1:10,]$freq, las = 2, names.arg = insta_2[1:10,]$word,
        col ="yellow", main ="Most frequent words",
        ylab = "Word frequencies")

set.seed(1234)
wordcloud(insta_text_corpus,min.freq=1,max.words=80,scale=c(2.2,1), colors=brewer.pal(8, "Dark2"),random.color=T, random.order=F)

