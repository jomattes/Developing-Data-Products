library(shiny); library(googlesheets); library(ggplot2); library(dplyr)

table <- "HAI-State"

loadData <- function(){
  #Grab the Google Sheet
  sheet <- gs_title(table)
  #Add the data as a new row
  gs_read_csv(sheet)
}

shinyServer(
  function(input, output){
    #load data
    hai_data <- loadData()
    #reformat
    hai_data$Score <- as.numeric(as.character(hai_data$Score))
    #filter out non-states
    hai_data <- filter(hai_data, State != "AS" & State != "GU" &
                         State != "MP" & State != "PR" & State != "VI" &
                         State != "DC")
    #load plot
    output$new_plot <- renderPlot({
      hai_data <- filter(hai_data, MeasureID == input$id1)
      hai_data <- group_by(hai_data, State) %>% summarize(mean(Score))
      names(hai_data) <- c("State", "avgScore")
      hai_data <- hai_data[complete.cases(hai_data),]
      g <- ggplot(hai_data, aes(x = reorder(State, avgScore), y = avgScore, 
                                label = round(avgScore, 2), nudge_x = 10)) + 
        geom_bar(stat = "identity", fill = "steelblue") + coord_flip() + 
        geom_text(size = 4) + 
        labs(y = "HAI SIR Rate", x = "State")
      print(g)
    }, height = 750, width = 800)
  }
)